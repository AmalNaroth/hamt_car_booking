import 'package:flutter/material.dart';

class EmployeesModel {
  String name;
  String location;
  String date;
  String time;
  String driverService;
  String carType;
  String status;

  EmployeesModel({
    required this.name,
    required this.location,
    required this.date,
    required this.time,
    required this.driverService,
    required this.carType,
     this.status = "false"
  });

  // Convert the EmployeesModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'date': date, // Convert DateTime to ISO 8601 string
      'time': time, // Convert TimeOfDay to a formatted string
      'driverService': driverService,
      'carType': carType,
      'status' : status
    };
  }
}
