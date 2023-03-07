import 'package:coffee_shop_flutter/pages/coffee_page.dart';
import 'package:coffee_shop_flutter/pages/coffee_type.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? searchedvalue;
  List coffeeData = [
    ['Capuccino', true],
    ['Latte', false],
    ['Espresso', false]
  ];

  void _onTextChanged(String value) {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        searchedvalue = value;
        print('${coffeeData.length}');
      });
    });
  }

  void coffeeTypeSelected(int index) {
    setState(() {
    for(var i = 0; i < coffeeData.length; i++) {
      coffeeData[i][1] = false;
    }
    coffeeData[index][1] = true;
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '')
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('En sevdiyiniz coffee secin', style: TextStyle(fontSize: 36),),
          ),
          const SizedBox(height: 40,),
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
          const SizedBox(height: 20,),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeData.length,
              itemBuilder: (context, index) {
                return CoffeeType(coffeeType: coffeeData[index][0], isSelected: coffeeData[index][1], 
                onTap: () {
                  coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            // backend'e qosuldugu zaman ListView.Builder cevirin...
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
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