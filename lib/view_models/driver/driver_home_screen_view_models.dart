import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/models/drivers_models.dart';

class DriverHomeScreenViewModels extends ChangeNotifier {
  Future<void> updateStatus(
      {required String statusValue,
      required QueryDocumentSnapshot driverSnapShot,
      required QueryDocumentSnapshot bookingSnapshot}) async {
    final driverInstance = DriversModels(
        rideDetails: bookingSnapshot['rideDetails'], rideStatus: statusValue);
    await updateDriverStatus(
        bookingSnapshot: bookingSnapshot,
        driverSnapShot: driverSnapShot,
        updateValue: driverInstance,
        statusValue: statusValue);
  }

  Future<void> updateDriverStatus(
      {required QueryDocumentSnapshot driverSnapShot,
      required QueryDocumentSnapshot bookingSnapshot,
      required DriversModels updateValue,required String statusValue}) async {
    await FirebaseFirestore.instance
        .collection("Drivers")
        .doc(driverSnapShot.id)
        .collection("Booking Details")
        .doc(bookingSnapshot.id)
        .update(
          updateValue.toMap(),
        );
    await FirebaseFirestore.instance
        .collection("Drivers")
        .doc(driverSnapShot.id)
        .update(
      {
        "name": driverSnapShot['name'],
        "profileImage": driverSnapShot['profileImage'],
        'status': statusValue,
        'rideDetails': driverSnapShot['rideDetails'],
      },
    );
  }
}
