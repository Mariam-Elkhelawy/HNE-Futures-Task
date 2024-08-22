import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Currency & Gold Prices'),
       
        ),
        bottomNavigationBar: BottomNavigationBar(items: []),
      
      ),
    );
  }
}

