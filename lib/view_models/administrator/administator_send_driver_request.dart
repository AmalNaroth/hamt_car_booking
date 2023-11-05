import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/models/drivers_models.dart';

class AdministratorSendSendDriverRequest extends ChangeNotifier{
   Future<void> sendDriverRequest(QueryDocumentSnapshot driverDetails,String rideDetails)async{
    final rideInstance = DriversModels(rideDetails: rideDetails);
    await FirebaseFirestore.instance.collection("Drivers").doc(driverDetails.id).collection("Booking Details").add(
      rideInstance.toMap()
    );
  }
}