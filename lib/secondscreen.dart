import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String username = '';
  int age = 0;
  String gender = '';
  final firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please Enter the Information Below',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                20,
                30,
                20,
                20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  username = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                20,
                30,
                20,
                20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
                onChanged: (value) {
                  age = int.parse(value);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                20,
                30,
                20,
                20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
                onChanged: (value) {
                  gender = value;
                },
              ),
            ),
            RaisedButton.icon(
              color: Colors.deepOrangeAccent,
              onPressed: () {
                firestore.collection('users').document(username).setData({
                  'age': age,
                  'gender': gender,
                });
              },
              icon: Icon(
                Icons.arrow_forward,
              ),
              label: Text(
                'Submit',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
