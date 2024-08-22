import 'package:flutter/material.dart';

class GoldTab extends StatelessWidget {
  const GoldTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

// class GoldPricesScreen extends StatelessWidget {
//   Future<List<GoldPrice>> fetchGoldPrices() async {
//     final response = await http.get(Uri.parse('https://www.goldapi.io/api/latest'));
//     // Parse the response...
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: fetchGoldPrices,
//       child: FutureBuilder(
//         future: fetchGoldPrices(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final prices = snapshot.data as List<GoldPrice>;
//             return ListView.builder(
//               itemCount: prices.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('${prices[index].goldType}: ${prices[index].price} EGP'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
