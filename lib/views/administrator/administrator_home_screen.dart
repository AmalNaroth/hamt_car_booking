import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';

class AdministratorHomeScreen extends StatefulWidget {
  const AdministratorHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdministratorHomeScreen> createState() =>
      _AdministratorHomeScreenState();
}

class _AdministratorHomeScreenState extends State<AdministratorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 186, 186),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Employees").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              itemBuilder: (context, index) {
                final doc = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    title: Text(doc["name"] as String),
                    subtitle: Text(doc['location'] as String),
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
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
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
