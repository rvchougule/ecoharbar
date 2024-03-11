import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:waste_managemet_app/Screens/pages/dashboard.dart';
import 'package:waste_managemet_app/Screens/pages/dustbin_card.dart';

class HomeInfo extends StatefulWidget {
  const HomeInfo({super.key});

  @override
  State<HomeInfo> createState() => _HomeInfoState();
}

final databaseReference = FirebaseDatabase.instance.ref("StoreData");

class _HomeInfoState extends State<HomeInfo> {
  final user = FirebaseAuth.instance.currentUser;
  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    return Column(
                      children: [
                        // const Expanded(child: DashBoard()),
                        DustbinCard(
                          wsId: snapshot.child("WS_ID").value.toString(),
                          dustbinLevel:
                              snapshot.child("Dustbin_Level").value.toString(),
                          location:
                              "${snapshot.child("lat").value.toString()}, ${snapshot.child("log").value.toString()}",
                        ),
                      ],
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => signout()),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }
}
