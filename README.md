# HNE Futures Task 📊💰

A Flutter application that provides real-time exchange rates and gold prices, allowing users to easily access and monitor financial data. The app features a responsive UI with tabs for currency exchange rates and gold prices, data fetching from public APIs, and manual data refresh.

## Features

### Currency Tab 💵
- **Displays Exchange Rates**: Shows the exchange rate of EGP (Egyptian Pound) to EUR (Euro).
- **Currency Conversion**: Allows conversion between EGP and EUR.
- **Data Source**: Fetches exchange rates from a public API.

### Gold Tab 🏅
- **Displays Gold Prices**: Shows the current prices of different gold purities (24K, 18K, etc.) in EGP.
- **Data Source**: Retrieves gold prices from a public API.

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
