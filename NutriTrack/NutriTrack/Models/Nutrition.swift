
struct Result: Codable, Hashable {
    var result : [Nutrition]
}

struct Nutrition: Codable, Hashable {
    let name: String
    let calories: Double
    let servingSize: Double
    let fatTotal: Double
    let fatSaturated: Double
    let protein: Double
    let sodium: Int
    let potassium: Int
    let cholesterol: Int
    let carbohydrates: Double
    let fiber: Double
    let sugar: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case calories
        case servingSize = "serving_size_g"
        case fatTotal = "fat_total_g"
        case fatSaturated = "fat_saturated_g"
        case protein = "protein_g"
        case sodium = "sodium_mg"
        case potassium = "potassium_mg"
        case cholesterol = "cholesterol_mg"
        case carbohydrates = "carbohydrates_total_g"
        case fiber = "fiber_g"
        case sugar = "sugar_g"
    }
}

