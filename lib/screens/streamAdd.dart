import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


///this example wii both add data to firebase and read it
///using Maps and a very basic example
class AddDataToFireStore extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  TextEditingController _other = TextEditingController();
  final db = Firestore.instance;

 // CollectionReference collectionReference = Firestore.instance.collection('info');


 // String yttt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Data to Firestore")),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _other,
              decoration: InputDecoration(hintText: 'Enter Details'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Add'),
              color: Colors.red,
              onPressed: () async {
                // DocumentReference ref =
                await db.collection('info').add({'title': _controller.text, 'details': _other.text});
              },
            ),

          ),
          SizedBox(height: 20.0),
          StreamBuilder<QuerySnapshot>(
              stream: db.collection('info').snapshots(),
              //stream: db.collection('info').where("title", isEqualTo:'yttt').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.documents.map((doc) {
                      return ListTile(title: Text(doc.data['title']));
                    }).toList(),
                  );

                } else {
                  return SizedBox();
                }
              }),
        ],
      ),
    );
  }
}