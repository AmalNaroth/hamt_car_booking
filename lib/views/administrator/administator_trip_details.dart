import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/models/employees_models.dart';
import 'package:xmt_car_booking_app/utils/color_constants.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/administrator/administrator_tripdetails_viewmodels.dart';
import 'package:xmt_car_booking_app/views/widgets/text_widget.dart';

class AdministratorTripDetails extends StatelessWidget {
  AdministratorTripDetails({super.key, this.index});
  int? index;

  static String administratorTripDetails = "Administrator-Trip-Details";

  @override
  Widget build(BuildContext context) {
    final administratorTripDetails =
        context.watch<AdministratorTripDetailsViewModels>();
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Employees").snapshots(),
            builder: (context, snapshot) {
              final doc = snapshot.data!.docs[index!];
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        children: [
                          fHight50,
                          TextWidget(
                              text: "Name: ${doc['name']}",
                              color: blackColor,
                              size: 20),
                          fHight10,
                          Text(
                              
                                  "Pick-up point: ${doc['pickpoint']} --> Destination: ${doc['destination']}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                     color: blackColor,
                              fontSize: 20
                                  ),
                             ),
                          fHight10,
                          TextWidget(
                              text: "Date: ${doc['date']}",
                              color: blackColor,
                              size: 20),
                          fHight10,
                          TextWidget(
                              text: "Time: ${doc['time']}",
                              color: blackColor,
                              size: 20),
                          fHight10,
                          TextWidget(
                              text: "Car type: ${doc['carType']}",
                              color: blackColor,
                              size: 20),
                          fHight10,
                          TextWidget(
                              text: "Diver Service: ${doc['driverService']}",
                              color: blackColor,
                              size: 20),
                              fHight10,
                          doc['driverName']!=null ?  TextWidget(
                              text: "Driver name: ${doc['driverName']}",
                              color: blackColor,
                              size: 20) : SizedBox(),
                          fHight20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: doc["status"] == "true"
                                        ? Colors.green
                                        : Colors.grey),
                                onPressed: () {
                                  String _driverName='Daniel';
                                      TextEditingController();
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        contentPadding: EdgeInsets.all(20),
                                        title: Text("Enter the driver name"),
                                        children: [
                                          TextFormField(
                                            onChanged: (value) {
                                              _driverName=value;
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: "name"),
                                          ),
                                          fHight20,
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Submit"),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                  final userUpdateInstance = EmployeesModel(
                                      name: doc["name"],
                                      pickpoint: doc["pickpoint"],
                                      date: doc["date"],
                                      time: doc["time"],
                                      driverService: doc["driverService"],
                                      carType: doc["carType"],
                                      status: "true",
                                      destination: doc['destination'],
                                      driverName: _driverName);
                                  administratorTripDetails.updateStatus(
                                      doc.id, userUpdateInstance);
                                },
                                child: Text("Yes"),
                              ),
                              fWidth20,
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: doc["status"] == "false"
                                        ? Colors.green
                                        : Colors.grey),
                                onPressed: () {
                                  final userUpdateInstance = EmployeesModel(
                                      name: doc["name"],
                                      pickpoint: doc["pickpoint"],
                                      date: doc["date"],
                                      time: doc["time"],
                                      driverService: doc["driverService"],
                                      carType: doc["carType"],
                                      status: "false",
                                      destination: doc['destination']);
                                  administratorTripDetails.updateStatus(
                                      doc.id, userUpdateInstance);
                                },
                                child: Text("No"),
                              ),
                            ],
                          ),
                          fHight30,
                          ElevatedButton.icon(
                            onPressed: () async {
                              Clipboard.setData(
                                ClipboardData(
                                    text:
                                        "Name: ${doc['name']}\nPickpoint: ${doc['pickpoint']} --> Destination: ${doc['destination']}\nDate: ${doc['date']}\nTime: ${doc['time']}\nCar type: ${doc['carType']}\nDiver Service: ${doc['driverService']}"),
                              );
                            },
                            icon: Icon(Icons.closed_caption_disabled),
                            label: Text("Copy"),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
