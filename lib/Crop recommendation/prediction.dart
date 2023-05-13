import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlowerClassification extends StatefulWidget {
  @override
  _FlowerClassificationState createState() => _FlowerClassificationState();
}

class _FlowerClassificationState extends State<FlowerClassification> {
  final _formKey = GlobalKey<FormState>();
  late double _sepalLength;
  late double _sepalWidth;
  late double _petalLength;
  late double _petalWidth;
  String _predictedClass = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Send a POST request to the Flask API
      final response = await http.post(
        Uri.parse('http://10.161.163.42:5000/flower'),
        body: {
          'sepal_length': _sepalLength.toString(),
          'sepal_width': _sepalWidth.toString(),
          'petal_length': _petalLength.toString(),
          'petal_width': _petalWidth.toString(),
        },
      );

      if (response.statusCode == 200) {
        // Parse the predicted class from the JSON response
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          _predictedClass = jsonResponse['class'];
        });
      } else {
        // Handle errors
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Classification'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Sepal length'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sepalLength = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sepal width'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sepalWidth = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Petal length'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _petalLength = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Petal width'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _petalWidth = double.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Predict'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Predicted class: $_predictedClass',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
