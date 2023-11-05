import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/administrator/administrator_tripdetails_viewmodels.dart';
import 'package:xmt_car_booking_app/views/administrator/administator_trip_details.dart';

class AdministratorHomeScreen extends StatefulWidget {
  const AdministratorHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdministratorHomeScreen> createState() =>
      _AdministratorHomeScreenState();
}

class _AdministratorHomeScreenState extends State<AdministratorHomeScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 186, 186),
      appBar: AppBar(
        title: const Text('Administator home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.pending),
              text: "Pending",
            ),
            Tab(
              icon: Icon(Icons.done),
              text: "Approved",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          pendingWidget(),
          approvedWidger(),
        ],
      ),
    );
  }

  Widget pendingWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Employees").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              return doc["status"] == "false"
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  AdministratorTripDetails(index: index),
                            ),
                          );
                        },
                        title: Text(doc["name"] as String),
                        subtitle: Text(
                            "${doc['pickpoint']} --> ${doc['destination']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(doc["date"] as String),
                            fWidth10,
                            CircleAvatar(
                                radius: 5,
                                backgroundColor: doc['status'] == "true"
                                    ? Colors.green
                                    : Colors.red)
                          ],
                        ),
                      ),
                    )
                  : SizedBox();
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: snapshot.data!.docs.length,
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget approvedWidger() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Employees").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              return doc['status'] == "true"
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  AdministratorTripDetails(index: index),
                            ),
                          );
                        },
                        title: Text(doc["name"] as String),
                        subtitle: Text(
                            "${doc['pickpoint']} --> ${doc['destination']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(doc["date"] as String),
                            fWidth10,
                            CircleAvatar(
                                radius: 5,
                                backgroundColor: doc['status'] == "true"
                                    ? Colors.green
                                    : Colors.red)
                          ],
                        ),
                      ),
                    )
                  : SizedBox();
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: snapshot.data!.docs.length,
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
