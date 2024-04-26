//
//  HealthOverview.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI
import HealthKit

struct HealthOverview: View {
    @State private var stepCount: Double = 0
    @State private var activeEnergyBurned: Double = 0
    @State private var sleepAnalysis: String = "Unknown"
    @State private var heartRate: Int = 0
    
    @State var measuring = false
     
    let red = Color(.red)
     
    
    
    let healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    var body: some View {
            VStack {
                HeadingView(name: "Fugazi")
                HStack {
                    Spacer()
                    VStack {
                        CalorieCircleView(value: activeEnergyBurned, goalValue: 1000)
                        Spacer().frame(height: 15)
                        SleepCircleView(value: 5.0, goalValue: 8.0)
                    }
                    Spacer()
                    VStack {
                        StepsView(value: stepCount)
                        HeartRateView(value: "\(Int(heartRate))")
                    }
                }
                Spacer()
            
        }
        .onAppear(perform: start)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.black
                    .ignoresSafeArea()
            }
        /*VStack {
            HealthDataView(title: "Steps", value: "\(Int(stepCount))")
            HealthDataView(title: "Calories Burned", value: "\(Int(activeEnergyBurned))")
            HealthDataView(title: "Sleep Analysis", value: "\(sleepAnalysis)")
            HealthDataView(title: "Heart Rate", value: "\(Int(heartRate))")
        }
        .onAppear {
            requestAuthorization()
            startHeartRateQuery()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.black
                    .ignoresSafeArea()
            }*/
    }
    
    func start() {
        requestAuthorization()
        startHeartRateQuery()
    }
    
    private func requestAuthorization() {
        let typesToRead: Set = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        
        healthStore.requestAuthorization(toShare: typesToRead, read: typesToRead) { (success, error) in
            if success {
                print("Authorization granted")
                fetchHealthData()
            } else {
                print("Authorization failed")
            }
        }
    }
    
    private func fetchHealthData() {
        fetchStepCount()
        fetchActiveEnergyBurned()
        fetchSleepAnalysis()
    }
    
    private func fetchStepCount() {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictEndDate)
        
        guard let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, result, error) in
            guard let result = result, let sum = result.sumQuantity() else { return }
            stepCount = sum.doubleValue(for: .count())
        }
        
        healthStore.execute(query)
    }
    
    private func fetchActiveEnergyBurned() {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictEndDate)
        
        guard let activeEnergyBurnedType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        
        let query = HKStatisticsQuery(quantityType: activeEnergyBurnedType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, result, error) in
            guard let result = result, let sum = result.sumQuantity() else { return }
            self.activeEnergyBurned = sum.doubleValue(for: .kilocalorie())
        }
        
        healthStore.execute(query)
    }
    
    private func fetchSleepAnalysis() {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictEndDate)
        
        guard let sleepAnalysisType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else { return }
        
        let query = HKSampleQuery(sampleType: sleepAnalysisType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            guard let samples = samples as? [HKCategorySample] else { return }
            
            var totalSleepDuration: TimeInterval = 0
            
            for sample in samples {
                if sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue {
                    totalSleepDuration += sample.endDate.timeIntervalSince(sample.startDate)
                }
            }
            
            let hours = totalSleepDuration / 3600 // Convert seconds to hours
            self.sleepAnalysis = String(format: "%.1f hours", hours)
        }
        
        healthStore.execute(query)
    }
    
    func startHeartRateQuery() {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            print("Heart rate data type not available.")
            return
        }
        
        // Set up query parameters
        let query = HKObserverQuery(sampleType: sampleType, predicate: nil) { query, completionHandler, error in
            if let error = error {
                print("Error observing heart rate changes: \(error.localizedDescription)")
                return
            }
            
            self.fetchLatestHeartRateSample { heartRate, error in
                if let error = error {
                    print("Error fetching heart rate: \(error.localizedDescription)")
                    return
                }
                
                if let heartRate = heartRate {
                    self.heartRate = Int(heartRate)
                }
            }
        }
        
        // Register the query
        HKHealthStore().execute(query)
    }
    
    func fetchLatestHeartRateSample(completion: @escaping (Double?, Error?) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: HKObjectType.quantityType(forIdentifier: .heartRate)!, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, samples, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let samples = samples as? [HKQuantitySample], let heartRateSample = samples.first else {
                completion(nil, nil)
                return
            }
            
            completion(heartRateSample.quantity.doubleValue(for: HKUnit(from: "count/min")), nil)
        }
        
        HKHealthStore().execute(query)
    }


}


#Preview {
    HealthOverview()
}
