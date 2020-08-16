import 'package:cloud_firestore/cloud_firestore.dart';


///CRUD class

class crudMethods{

  ///Adding data to fbdb
  Future<void> addData(carData) async{
    Firestore.instance.collection('testcrud').add(carData).catchError((e){
      print(e);
    });
  }
}
