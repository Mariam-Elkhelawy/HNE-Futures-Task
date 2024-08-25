# HNE Futures Task 📊💰

# Overview 🌟

This Flutter app for HNE Futures features two tabs:

- **Currency Tab** 💵: Displays the exchange rate between EGP (Egyptian Pound) and EUR (Euro) and allows currency conversion.
- **Gold Tab** 🏅: Shows gold prices in Egypt, including different gold types (e.g., 24K, 18K) and their prices per gram or ounce.

Both tabs fetch data from public APIs and include testing functionalities.

## Features ✨
- **Currency Exchange** 💹: View EGP to EUR rates and perform currency conversions.
- **Gold Prices** 🏅: View current gold prices in Egypt for various gold types (24K, 18K, etc.).
- **Pull-to-Refresh** 🔄: Manually refresh data by pulling down on the screen.


## Technology Stack 🛠️

- **Flutter** 🐦: For cross-platform app development.
- **Clean Architecture** 🏗️: Organizes code into layers for maintainability.
- **BLoC** 🧩: Manages application state and business logic.
- **Dio** 🚀: Handles API requests and responses.
- **Restful APIs** 🌐: Provides data from external services.
- **ScreenUtilInit** 📐: Ensures responsiveness across different screen sizes and orientations.


## Testing 🧪
Testing ensures the app functions correctly across various states:

- **Display Data** ✅: Verify correct display of currency rates and gold prices when data is successfully fetched.
- **Error Handling** ❌: Ensure appropriate error messages are shown if data fetching fails.
- **Loading State** ⏳: Check that a loading indicator is visible while data is being fetched.

Tests are written for both tabs to ensure consistency and reliability.

## Installation 🛠️

To get started with this project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Mariam-Elkhelawy/HNE-Futures-Task

2. **Navigate to the project directory**:
 
   ```bash
   cd HNE-Futures-Task
   
3. **Install dependencies**:
 
   ```bash
   flutter pub get

4. **Define API Keys in Constants File** : </br>   Navigate to the utils folder located within the core folder and add your Api key :

   ```bash
   static const String GOLD_ACCESS_TOKEN = 'your_api_key_here';
   static const String CURRENCY_ACCESS_TOKEN = 'your_api_key_here';
  
5. **Run the app**:  

   ```bash
   flutter run
