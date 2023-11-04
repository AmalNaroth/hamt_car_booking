import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeServicesViewmodels extends ChangeNotifier{
  Future<dynamic> getData() async{
    return await FirebaseFirestore.instance.collection("Employees").get();
  }
}