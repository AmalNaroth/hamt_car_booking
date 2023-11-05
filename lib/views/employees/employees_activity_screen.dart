import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/view_models/employees/employee_activity_view_models.dart';

class EmployeesActivityScreen extends StatefulWidget {
  const EmployeesActivityScreen({super.key});

  @override
  State<EmployeesActivityScreen> createState() =>
      _EmployeesActivityScreenState();
}

class _EmployeesActivityScreenState extends State<EmployeesActivityScreen> {
  QuerySnapshot? bookingDetails;

  @override
  void initState() {
    context.read<EmployeeServicesViewmodels>().getData().then((value) {
      setState(() {
        bookingDetails = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bookingUpdate());
  }

  Widget bookingUpdate() {
    if (bookingDetails != null) {
      return ListView.separated(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          itemBuilder: (context, index) {
            return Card(
              child: bookingDetails!.docChanges[index].doc["driverName"] != null ?
               ListTile(
                leading: CircleAvatar(
                    backgroundColor:
                        bookingDetails!.docChanges[index].doc["status"] ==
                                "false"
                            ? Colors.red
                            : Colors.green),
                title: Text(
                 "${bookingDetails!.docChanges[index].doc["name"]}\n${bookingDetails!.docChanges[index].doc["pickpoint"]} --> ${bookingDetails!.docChanges[index].doc["destination"]}"
                 
                ),
                subtitle: Text("Driver name: ${bookingDetails!.docChanges[index].doc["driverName"]}"),
                trailing: Text(
                  "Your ride approved on\n ${bookingDetails!.docChanges[index].doc["date"]}"
                  ,style: TextStyle(
                  color: Colors.green
                 ),
                  )
                ):
                ListTile(
                leading: CircleAvatar(
                    backgroundColor:
                        bookingDetails!.docChanges[index].doc["status"] ==
                                "false"
                            ? Colors.red
                            : Colors.green),
                title: Text(
                 "${bookingDetails!.docChanges[index].doc["name"]}\n${bookingDetails!.docChanges[index].doc["pickpoint"]} --> ${bookingDetails!.docChanges[index].doc["destination"]}"
                ),
                subtitle: Text("Your ride on processing please wait!!!!"),
                trailing: Text(
                  bookingDetails!.docChanges[index].doc["date"]
                  )
                )
              );
          },
          separatorBuilder: (context, index) {
            return SizedBox();
          },
          itemCount: bookingDetails!.docChanges.length);
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
