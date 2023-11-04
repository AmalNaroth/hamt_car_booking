

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdministatorHomeViewModel extends ChangeNotifier{
  getData()async{
   return await FirebaseFirestore.instance.collection("Employees").snapshots();
  }
}