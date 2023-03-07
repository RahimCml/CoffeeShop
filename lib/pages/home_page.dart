import 'package:coffee_shop_flutter/pages/coffee_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? searchedvalue;

  void _onTextChanged(String value) {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        searchedvalue = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
           Padding(
             padding: EdgeInsets.only(right: 18),
             child: Icon(Icons.person),
           )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '')
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('En sevdiyiniz coffee secin', style: TextStyle(fontSize: 36),),
          ),
          const SizedBox(height: 20,) ,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Coffee secin...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                )
              ),
              onChanged: _onTextChanged
            ),
          ),
          Expanded(
            flex: 1,
            // backend'e qosuldugu zaman ListView.Builder cevirin...
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CoffeePage(),
                  CoffeePage(),
                  CoffeePage(),
                ],
              ),
            )
            )
        ],
      ),
    );
  }
}