import 'package:flutter/material.dart';

class NHigh extends StatefulWidget {
  final String? name;
  final double n, p, k;
  const NHigh(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<NHigh> createState() => _NHighState();
}

class _NHighState extends State<NHigh> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('High Nitrogen recommendations'),
      ),
      body: Center(child: SingleChildScrollView(child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(60, 15, 0, 10),
              child: Text(
                'Your Input values are:\n\nNitrogen=${widget.n}\nPhosphorus=${widget.p}\nPotassium=${widget.k}\ncrop name=${widget.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
          Container(padding: EdgeInsets.all(20), child: Text('The Nitrogen value of your soil is high\n\n suggestions\n\n1.  adding manure is one of the simplest ways to amend your soil with nitrogen. Be careful as there are various types of manures with varying degrees of nitrogen.\n\n2. use your morning addiction to feed your gardening habit! Coffee grinds are considered a green compost material which is rich in nitrogen. Once the grounds break down, your soil will be fed with delicious, delicious nitrogen. An added benefit to including coffee grounds to your soil is while it will compost, it will also help provide increased drainage to your soil.\n\n3.planting vegetables that are in Fabaceae family like peas, beans and soybeans have the ability to increase nitrogen in your soil.\n\n4. Plant ‘green manure’ crops like cabbage, corn and brocolli\n\n5.Use mulch (wet grass) while growing crops')),
        ],
      ),)),
    );
  }
}