import 'package:flutter/material.dart';

class Plow extends StatefulWidget {
   final String? name;
  final double n, p, k;
  const Plow(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<Plow> createState() => _PlowState();
}

class _PlowState extends State<Plow> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('low phosphoreus recommendations'),
      ),
      body: Center(child: SingleChildScrollView(child: Container(padding: EdgeInsets.all(20), child: Text('The phosphoreus value of your soil is low\n\nTake suggestions\n\n1. Bone meal -a fast acting source that is made from ground animal bones which is rich in phosphorous.\n\n2. applying a fertilizer with a high phosphorous content in the NPK ratio (example: 10-20-10, 20 being phosphorous percentage).\n\n3. adding quality organic compost to your soil will help increase phosphorous content.\n\n4. as with compost, manure can be an excellent source of phosphorous for your plants\n\n5. introducing clay particles into your soil can help retain & fix phosphorus deficiencies\n\n6. Ensure proper soil pH -having a pH in the 6.0 to 7.0 range has been scientifically proven to have the optimal phosphorus uptake in plants.\n\n7. If soil pH is low, add lime or potassium carbonate to the soil as fertilizers. Pure calcium carbonate is very effective in increasing the pH value of the soil.\n\n8. If pH is high, addition of appreciable amount of organic matter will help acidify the soil. Application of acidifying fertilizers, such as ammonium sulfate, can help lower soil pH')),)),
    );
  }
}