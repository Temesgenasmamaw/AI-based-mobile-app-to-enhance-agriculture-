import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Prediction extends StatefulWidget {
  const Prediction({super.key});

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  final url = Uri.parse('http://10.161.84.112:5000/flower/predict');

  final sepalLengthController = TextEditingController();
  final sepalWidthController = TextEditingController();
  final petalLengthController = TextEditingController();
  final petalWidthController = TextEditingController();

  void sendRequest() {
    final data = {
      'sepal_length': double.parse(sepalLengthController.text),
      'sepal_width': double.parse(sepalWidthController.text),
      'petal_length': double.parse(petalLengthController.text),
      'petal_width': double.parse(petalWidthController.text),
    };

    http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    ).then((response) {
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // parse the JSON response
        print('sucess: ${response.statusCode}');
        final responseData = jsonDecode(response.body);
        print('Pass: ${response.statusCode}');
        print('Prediction: ${responseData['prediction']}');
      } else {
        // If the server did not return a 200 OK response,
        // print the error message
        print('Error: ${response.reasonPhrase}');
      }
    }).catchError((error) {
      // If there was an error sending the request,
      // print the error message
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: sepalLengthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Sepal Length',
            ),
          ),
          TextField(
            controller: sepalWidthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Sepal Width',
            ),
          ),
          TextField(
            controller: petalLengthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Petal Length',
            ),
          ),
          TextField(
            controller: petalWidthController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Petal Width',
            ),
          ),
          ElevatedButton(
            onPressed: sendRequest,
            child: Text('Send Request'),
          ),
        ],
      ),
    );
  }
}
