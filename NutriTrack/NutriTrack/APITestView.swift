import SwiftUI


struct APITestView: View {
    
    @State private var result = [Nutrition]()
    
    var body: some View {
        List(result, id: \.self) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("Calories: \(item.calories)")
            }
        }
        .onAppear {
            Task {
                await callAPI()
            }
        }
    }
    
    private func callAPI() async {
        let query = "3 eggs and a banana".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/nutrition?query="+query!)!
        var request = URLRequest(url: url)
        request.setValue("CoGoxCyj4fSBJiUQFo/OjA==YPeYhNjRKFXrSSHQ", forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            result = try JSONDecoder().decode([Nutrition].self, from: data)
            
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

    
    
    
    #Preview {
        APITestView()
    }

