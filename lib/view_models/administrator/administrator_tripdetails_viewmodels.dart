import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/models/employees_models.dart';

class AdministratorTripDetailsViewModels extends ChangeNotifier {
  Future<void> updateStatus(
      String updateId, EmployeesModel updateValue) async {
    await FirebaseFirestore.instance
        .collection("Employees")
        .doc(updateId)
        .update(updateValue.toMap()).onError((error, stackTrace) {
          print("Error");
        });
        notifyListeners();
  }
}
