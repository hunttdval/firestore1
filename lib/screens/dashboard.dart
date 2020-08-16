import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestoreplay/services/crud.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {


  String carModel, carColor;
  crudMethods crudObj = new crudMethods();

  Future<bool> addDialog(BuildContext context)async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Add data', style: TextStyle(fontSize: 15.0),),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car name'),
                  onChanged: (value){
                    this.carModel = value;
                  },
                ),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car color'),
                  onChanged: (value){
                    this.carColor = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Add'),
                  textColor: Colors.blue,
                  onPressed: () {

                    Map carData = {'carName': this.carModel, 'color': this.carColor};

                    crudObj.addData(carData).then((result){
                      dialogTrigger(context);
                    }).catchError((e){
                      print(e);
                    });
                    Navigator.of(context).pop();

                  },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Job done',style: TextStyle(fontSize: 15),),
          content: Text('Added'),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
              },
                child: Text('Alright'),
              textColor: Colors.blue,
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                addDialog(context);
              }
          )
        ],
      ),
    );
  }
}
