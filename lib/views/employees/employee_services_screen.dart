import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/models/employees_models.dart';
import 'package:xmt_car_booking_app/utils/color_constants.dart';
import 'package:xmt_car_booking_app/utils/emus.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/employees/employee_services_view_models.dart';
import 'package:xmt_car_booking_app/views/widgets/form_widget.dart';
import 'package:xmt_car_booking_app/views/widgets/text_widget.dart';

class EmployeesServicesScreen extends StatelessWidget {
  EmployeesServicesScreen({super.key});

  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String selectDriveServices = "";
  String selectCarType = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final employeeServiceProvier =
        Provider.of<EmployeeServicesViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextWidget(
                        text: "Services",
                        color: blackColor,
                        size: 30,
                        bold: FontWeight.bold),
                  ),
                  fHight20,
                  TextWidget(
                      text: "Go anywhere, get anything",
                      color: blackColor,
                      size: 17),
                  fHight20,
                  TextFormFieldWidget(
                      controller: _employeeNameController,
                      icon: Icons.person,
                      hinttext: "Employee name"),
                  fHight20,
                  TextFormFieldWidget(
                      controller: _locationController,
                      icon: Icons.location_city,
                      hinttext: "Location"),
                  fHight20,
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024),
                            ).then((value) {
                              employeeServiceProvier.setSelectDate = value!;
                            });
                          },
                          icon: employeeServiceProvier.getSelectedDate == null
                              ? Icon(Icons.calendar_month)
                              : Text(
                                  DateFormat.yMMMd()
                                      .format(employeeServiceProvier
                                          .getSelectedDate!)
                                      .toString(),
                                ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              employeeServiceProvier.setSelectedTime = value!;
                            });
                          },
                          icon: employeeServiceProvier.getSelectTime == null
                              ? Icon(Icons.schedule)
                              : Text(
                                  employeeServiceProvier.getSelectTime!
                                      .format(context),
                                ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DropdownButtonFormField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          hint: Text("Select driver service"),
                          items: driverSelection
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            selectDriveServices = value!;
                          },
                        ),
                      )
                    ],
                  ),
                  fHight20,
                  DropdownButtonFormField(
                    hint: Text("Select your car"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: cartype
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (carValue) {
                      selectCarType = carValue!;
                    },
                  ),
                  fHight20,
                  ElevatedButton(
                    onPressed: () async {
                      final employeesIntance = EmployeesModel(
                          name: _employeeNameController.text,
                          location: _locationController.text,
                          date: DateFormat.yMMMd()
                              .format(employeeServiceProvier.getSelectedDate!)
                              .toString(),
                          time: employeeServiceProvier.getSelectTime!
                              .format(context),
                          driverService: selectDriveServices,
                          carType: selectCarType);
                      await employeeServiceProvier
                          .addtoFirebase(employeesIntance).then((value) {
                            showDialog(context: context, builder: (context) {
                              return SimpleDialog(
                                title: Text("Submited"),
                                children: [],
                              );
                            },);
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Submit"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
