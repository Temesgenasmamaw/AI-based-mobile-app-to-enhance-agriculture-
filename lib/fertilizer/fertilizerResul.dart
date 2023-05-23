import 'package:flutter/material.dart';

class FertilizerResult extends StatefulWidget {
  String? fertilizerResult;
  FertilizerResult({required this.fertilizerResult});

  @override
  State<FertilizerResult> createState() => _FertilizerResultState();
}

class _FertilizerResultState extends State<FertilizerResult> {
  @override
   finalResul(String res){
    return res;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(

          
            child: Text(
          '${widget.fertilizerResult}',
          style: TextStyle(fontSize: 20),
          
        )),
      ),
    );
  }
}
