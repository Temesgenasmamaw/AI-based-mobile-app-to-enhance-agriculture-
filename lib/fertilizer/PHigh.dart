import 'package:flutter/material.dart';

class PHigh extends StatefulWidget {
   final String? name;
  final double n, p, k;
  const PHigh(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<PHigh> createState() => _PHighState();
}

class _PHighState extends State<PHigh> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('High phosphorus recommendations'),
      ),
     body: Center(child: SingleChildScrollView(child: Container(padding: EdgeInsets.all(20), child: Text('Your phosphorus is high and take following suggesions.\n\n1. Avoid adding manure- manure contains many key nutrients for your soil but typically including high levels of phosphorous. Limiting the addition of manure will help reduce phosphorus being added.\n\n2. Use only phosphorus-free fertilizer - if you can limit the amount of phosphorous added to your soil, you can let the plants use the existing phosphorus while still providing other key nutrients such as Nitrogen and Potassium. Find a fertilizer with numbers such as 10-0-10, where the zero represents no phosphorous.\n\n3. Water your soil - soaking your soil liberally will aid in driving phosphorous out of the soil. This is recommended as a last ditch effort.\n\n4. Plant nitrogen fixing vegetables to increase nitrogen without increasing phosphorous like beans and peas.\n\n5. Use crop rotations to decrease high phosphorous levels'),),)),
    );
  }
}