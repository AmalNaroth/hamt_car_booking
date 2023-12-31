import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/views/administrator/administator_allocate_driver_screen.dart';

class AdministratorDriverCheckScreen extends StatefulWidget {
  const AdministratorDriverCheckScreen({Key? key}) : super(key: key);

  @override
  State<AdministratorDriverCheckScreen> createState() =>
      _AdministratorDriverCheckScreenState();
}

class _AdministratorDriverCheckScreenState
    extends State<AdministratorDriverCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 211, 211),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Drivers").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
              itemBuilder: (context, index) {
                final doc = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AdministratorAllocateDriver(driverDetails: doc),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(doc['profileImage']),
                    ),
                    title: Text(doc["name"] as String),
                    trailing: doc['status'] == "true"
                        ? Card(
                            child: Container(
                              color: const Color.fromARGB(255, 126, 230, 129),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Approved"),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 5,
                            backgroundColor: doc['status'] == "true"
                                ? Colors.red
                                : Colors.green,
                          ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return fHight10;
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
      ),
    );
  }
}
