import 'package:flutter/material.dart';

class CoffeePage extends StatefulWidget {

  final String coffeeImgPath;
  final String ingredients;
  final String coffeeName;
  final double coffeePrice;

  const CoffeePage({
    Key? key,
    required this.coffeeImgPath,
    required this.ingredients,
    required this.coffeeName,
    required this.coffeePrice
  }) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(widget.coffeeImgPath)
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.coffeeName, style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 4,),
                  Text(widget.ingredients, style: TextStyle(color: Colors.grey[600]),),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${widget.coffeePrice} azn', style: const TextStyle(fontSize: 18),),
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