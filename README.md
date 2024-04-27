Original App Design Project - README 
===

# NutriTrack

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

NutriTrack is a user-friendly fitness and nutrition app designed to help users make informed dietary choices. Its primary purpose is to simplify healthy eating by identifying foods, calculating their calorie and macro/micro-nutrient content, and presenting this information in easy-to-understand graphs. The app integrates with HealthKit and Apple Watch to gather activity data, providing users with a comprehensive overview of their health and fitness. With features like nutrient, macro/micro-nutrient views, goal tracking, and recipe insights, NutriTrack offers a seamless user experience, making it easy for anyone to track and improve their nutritional intake.

### App Evaluation

- **Category:** Health & Fitness
- **Mobile:** Yes
- **Story:**  NutriTrack tells the story of empowering users to take control of their nutrition and fitness journey. It emphasizes the importance of making informed dietary choices and provides tools to help users achieve their wellness goals.
- **Market:** The target audience for NutriTrack includes health-conscious individuals, fitness enthusiasts, athletes, and anyone seeking to improve their dietary habits and overall well-being.
- **Habit:** NutriTrack is designed to be a daily use app, as users can track their meals, set goals, and monitor their progress on a regular basis.
- **Scope:** NutriTrack offers a broad range of features.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] Authentication
- [x] HealthKit integration
    - [x] Calories tracker
    - [x] Workout Info
    - [x] Heartrate
- [ ] Input foods and nutritional facts provided
- [ ] User recommended calorie, water, and protein intake

**Optional Nice-to-have Stories**

- [ ] Daily Info is retrievable
- [x] Steps
- [x] Sleep
- [ ] Calendar View
- [ ] Habit Tracker
- [ ] Identify foods using Computer Vision
- [ ] Previously Saved data is accessible
- [ ] Goal tracker involved with calendar
- [ ] User can choose what macro nutrients to track
- [ ] Notifications to eat and drink

### 2. Screen Archetypes

- [x] Login Screen
    * User can login
- [x] Registration Screen
    * User can create a new account
- [x] Stream
    * Overview(Calorie tracker, Workout Info, Heartrate)
        * Raw Information
        * Breakdown info
    * Water Intake View
    * Calorie View
    * Nutrient View(Input food)
- [ ] Settings
    * Personal Information
    * Edit app setting(Notifications and Goals)

### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [x] First Tab Overview 
- [ ] Second Tab Water Intake
- [ ] Third Tab Nutrients Intake


**Flow Navigation** (Screen to Screen)

- [x] Sign In Screen
  * Leads to Sign Up Screen
  * Leads to Overview Screen
- [x] Sign Up Screen
  * Leads to Overview Screen


## Wireframes

![Wireframes](https://hackmd.io/_uploads/ryIk6BvlR.jpg)
<img width="600" alt="Screenshot 2024-04-25 at 7 12 22 PM" src="https://github.com/Topusaha/NutriTrack/assets/137203168/2f4a3cff-2d65-4629-ab80-9aac7f6bfeb6">

<div>
    <a href="https://www.loom.com/share/7cc2575f5e714d36bdb65f6b4b092667">
    </a>
    <a href="https://www.loom.com/share/7cc2575f5e714d36bdb65f6b4b092667">
      <img style="max-width:600px;" src="https://cdn.loom.com/sessions/thumbnails/7cc2575f5e714d36bdb65f6b4b092667-with-play.gif">
    </a>
  </div>

## Schema 


### Models

[User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |



### Networking

- [List of network requests by screen]
- [Example: `[GET] /users` - to retrieve user data]
- ...
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

- [ ] Example
```
let query = "1lb brisket and fries".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
let url = URL(string: "https://api.api-ninjas.com/v1/nutrition?query="+query!)!
var request = URLRequest(url: url)
request.setValue("YOUR_API_KEY", forHTTPHeaderField: "X-Api-Key")
let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
    guard let data = data else { return }
    print(String(data: data, encoding: .utf8)!)
}
task.resume()
