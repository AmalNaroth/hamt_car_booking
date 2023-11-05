import 'package:flutter/material.dart';

class EmployeesModel {
  String name;
  String pickpoint;
  String destination;
  String date;
  String time;
  String driverService;
  String carType;
  String status;
  String? driverName;

  EmployeesModel({
    required this.name,
    required this.pickpoint,
    required this.date,
    required this.time,
    required this.driverService,
    required this.carType,
    required this.destination,
    this.status = "false",
    this.driverName,
  });

  // Convert the EmployeesModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pickpoint': pickpoint,
      'date': date, // Convert DateTime to ISO 8601 string
      'time': time, // Convert TimeOfDay to a formatted string
      'driverService': driverService,
      'carType': carType,
      'status': status,
      'driverName': driverName,
      'destination' : destination
    };
  }
}
