import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/models/employees_models.dart';

class EmployeeServicesViewModel extends ChangeNotifier {
  DateTime? selectDate;
  DateTime? get getSelectedDate => selectDate;
  set setSelectDate(DateTime value) {
    selectDate = value;
    notifyListeners();
  }

  TimeOfDay? selectTime;
  TimeOfDay? get getSelectTime => selectTime;
  set setSelectedTime(TimeOfDay value) {
    selectTime = value;
    notifyListeners();
  }

  Future<void> addtoFirebase(EmployeesModel employeeValue) async {
    await FirebaseFirestore.instance
        .collection("Employees")
        .add(employeeValue.toMap())
        .then((value) {
          print(value);
        })
        .onError((error, stackTrace) {
          print(error);
        });

    // await FirebaseFirestore.instance.runTransaction((Transaction transaction) async{
    //   CollectionReference reference = await FirebaseFirestore.instance.collection("Employees");
    //   reference.add(employeeValue);
    // }).then((value) {

    // });
  }
}
