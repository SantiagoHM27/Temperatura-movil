import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getEspData() async {
  List EspData = [];
  CollectionReference collectionReferenceEspData = db.collection('EspData');

  QuerySnapshot queryEspData = await collectionReferenceEspData.get();
  queryEspData.docs.forEach((documento) {
    EspData.add(documento.data());
   });

   return EspData;


}