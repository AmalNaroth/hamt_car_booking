import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/views/employees/employee_account_screen.dart';
import 'package:xmt_car_booking_app/views/employees/employee_services_screen.dart';
import 'package:xmt_car_booking_app/views/employees/employees_activity_screen.dart';


class EmployeesHomeScreen extends StatefulWidget {
  EmployeesHomeScreen({super.key});

  static String employeesHomeScreen = "EmployeesHomeScreen";

  @override
  State<EmployeesHomeScreen> createState() => _EmployeesHomeScreenState();
}

class _EmployeesHomeScreenState extends State<EmployeesHomeScreen> with TickerProviderStateMixin {

   late final TabController _tabController;

   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.local_activity),
            ),
            Tab(
              icon: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
           body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          EmployeesServicesScreen(),
          EmployeesActivityScreen(),
          EmployeesAccountScreen()
        ],
      ),
    );
  }
}
