import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _deptController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  final Stream<QuerySnapshot> fetchUserIno =
      FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference submittUserInfo =
      FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              // CircleAvatar(
              //   radius: 40.0,
              //   child: ClipRRect(
              //     child: Image.network(
              //         'https://cdn2.iconfinder.com/data/icons/perfect-flat-icons-2/512/User_login_man_profile_account.png'),
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _nameController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.red, width: 30),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (name) => name != null && name.isEmpty
                    ? 'please,Enter your name'
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _deptController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.red, width: 30),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Department',
                  hintText: 'Enter Your Department',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (name) => name != null && name.isEmpty
                    ? 'please,Enter your Department'
                    : null,
              ),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.red, width: 30),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'age',
                      hintText: 'Enter age'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (age) =>
                      age != null && age.length > 3 ? 'max char is 3' : null),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () {
                  submittUserInfo
                      .add({
                        'name': _nameController.text,
                        'age': int.parse(_ageController.text),
                        'department': _deptController.text
                      })
                      .then((value) => print('user add'))
                      .catchError((error) => print('faied $error'));
                },
                icon: const Icon(
                  Icons.lock_open,
                  size: 15,
                ),
                label: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
