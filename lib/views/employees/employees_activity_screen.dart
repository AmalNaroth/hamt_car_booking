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
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor:
                        bookingDetails!.docChanges[index].doc["status"] ==
                                "false"
                            ? Colors.red
                            : Colors.green),
                title: Text(
                  bookingDetails!.docChanges[index].doc["name"],
                ),
                subtitle: Text("Driver name"),
                trailing: Text(
                  bookingDetails!.docChanges[index].doc["date"]
                  )
                ),
              );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: bookingDetails!.docChanges.length);
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
