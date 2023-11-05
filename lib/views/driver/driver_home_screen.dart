import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/driver/driver_home_screen_view_models.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen>
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
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Drivers").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final driverScreenProvider = context.watch<DriverHomeScreenViewModels>();
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 187, 186, 186),
              appBar: AppBar(
                title: Text(snapshot.data!.docs[0]['name']),
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
                   pendingWidget(snapshot.data!.docs[0]),
                  approvedWidger(snapshot.data!.docs[0]),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget pendingWidget(QueryDocumentSnapshot value,) {
    final driverScreenProvider = context.watch<DriverHomeScreenViewModels>();
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Drivers")
          .doc(value.id)
          .collection("Booking Details")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              return doc["status"] == "false"
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: doc["status"] == "true" ? Colors.green : Colors.red,
                                ),
                                fWidth20,
                               Text(doc['rideDetails'])
                              ],
                            ),
                           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                   style:
                    ElevatedButton.styleFrom(backgroundColor: doc["status"] == "true" ? Colors.green : Colors.grey),
                  onPressed: () {
                   driverScreenProvider.updateStatus(statusValue: "true",driverSnapShot: value,bookingSnapshot: doc); 
                  },
                  child: Text("Yes"),
                ),
                fWidth20,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: doc["status"] == "false" ? Colors.green : Colors.grey),
                  onPressed: () {
                    driverScreenProvider.updateStatus(statusValue: "false",driverSnapShot: value,bookingSnapshot: doc); 
                  },
                  child: Text("No"),
                ),
              ],
            ),
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

  Widget approvedWidger(QueryDocumentSnapshot value) {
    final driverScreenProvider = context.watch<DriverHomeScreenViewModels>();
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Drivers")
          .doc(value.id)
          .collection("Booking Details")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              return doc['status'] == "true"
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                   backgroundColor: doc["status"] == "true" ? Colors.green : Colors.red,
                                ),
                                fWidth20,
                               Text(doc['rideDetails'])
                              ],
                            ),
                           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                   style:
                    ElevatedButton.styleFrom(backgroundColor: doc["status"] == "true" ? Colors.green : Colors.grey),
                  onPressed: () {
                     driverScreenProvider.updateStatus(statusValue: "true",driverSnapShot: value,bookingSnapshot: doc); 
                  },
                  child: Text("Yes"),
                ),
                fWidth20,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: doc["status"] == "false" ? Colors.green : Colors.grey),
                  onPressed: () {
                    driverScreenProvider.updateStatus(statusValue: "false",driverSnapShot: value,bookingSnapshot: doc); 
                  },
                  child: Text("No"),
                ),
              ],
            ),
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
