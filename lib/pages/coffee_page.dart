import 'package:flutter/material.dart';
class CoffeePage extends StatefulWidget {
  const CoffeePage({super.key});

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade900,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('lib/images/coffeeimg1.png')
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Capuccino', style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 4,),
                  Text('Steamed milk foam, Double espresso, Hot milk', style: TextStyle(color: Colors.grey[600]),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('6.00 azn', style: TextStyle(fontSize: 18),),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() {
                        amount += 1;
                      }),
                    ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}