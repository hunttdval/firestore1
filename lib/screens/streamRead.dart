import 'package:flutter/material.dart';
///import firestore package
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FireStore Demo!'
        ),
      ),
      body: StreamBuilder(
        /// .snapshot is for streams
        /// .documents takes database snapshots
        stream: Firestore.instance.collection('cars').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading... Please wait...');
          return Center(
            child: Column(
              children: <Widget>[
                Text(snapshot.data.documents[0]['brandname']),
                Text(snapshot.data.documents[0]['sold'].toString()),


              ],
            ),
          );
        },

      ),
    );
  }
}
