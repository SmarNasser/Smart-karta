import 'package:cloud_firestore/cloud_firestore.dart';
String res='1';

class ScanSearch
{
  searchByID (String id)
  {
    return Firestore.instance.collection('cars').where('id',isEqualTo: res ).getDocuments();
  }
}