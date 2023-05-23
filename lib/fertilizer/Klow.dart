import 'package:flutter/material.dart';

class Klow extends StatefulWidget {
   final String? name;
  final double n, p, k;
  const Klow(
      {super.key,
      required this.n,
      required this.p,
      required this.k,
      required this.name});

  @override
  State<Klow> createState() => _KlowState();
}

class _KlowState extends State<Klow> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        title: Text('Low potassium recommendations'),
      ),
      body: SingleChildScrollView(child: Center( child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(60, 15, 0, 10),
              child: Text(
                'Your Input values are:\n\nNitrogen=${widget.n}\nPhosphorus=${widget.p}\nPotassium=${widget.k}\ncrop name=${widget.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
          Container(padding: EdgeInsets.all(20), child: Text('The K value of your soil is low\n\nTake suggestions\n\n1.  Use Potash fertilizers since they contain high values potassium.\n\n2.  Mix in muricate of potash or sulphate of potash\n\n 3.  Bury banana peels an inch below the soils surface.\n\n4. Try kelp meal or seaweed')),
        ],
      )),),
    );
  }
}