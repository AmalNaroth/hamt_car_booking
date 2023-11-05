import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/administrator/administator_send_driver_request.dart';
import 'package:xmt_car_booking_app/views/widgets/text_widget.dart';

class AdministratorAllocateDriver extends StatelessWidget {
   AdministratorAllocateDriver({super.key,required this.driverDetails});

  QueryDocumentSnapshot driverDetails;

  TextEditingController _rideDetialsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: driverDetails['name'], color: Colors.black, size: 20,bold: FontWeight.bold),
                fHight20,
                TextFormField(
                  controller: _rideDetialsController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "User details"),
                  maxLines: 10,
                ),
                fHight20,
                ElevatedButton(
                  onPressed: () {
                    context.read<AdministratorSendSendDriverRequest>().sendDriverRequest(driverDetails,_rideDetialsController.text);
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
