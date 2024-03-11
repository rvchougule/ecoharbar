import 'package:flutter/material.dart';
import 'package:waste_managemet_app/RealTimeDatabase_CRUD/real_tim_crud.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController levelController = TextEditingController();
final TextEditingController latController = TextEditingController();
final TextEditingController logController = TextEditingController();

void createBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Add Dustbin",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "WD_ID",
                  hintText: "eg.001",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: levelController,
                decoration: const InputDecoration(
                  labelText: "Dustbin_Level(under 100%)",
                  hintText: "eg.67",
                ),
              ),
              TextField(
                controller: latController,
                decoration: const InputDecoration(
                  labelText: "Latitude",
                  hintText: "eg.18.520430",
                ),
              ),
              TextField(
                controller: logController,
                decoration: const InputDecoration(
                  labelText: "Logitude",
                  hintText: "eg.73.856743",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final id = DateTime.now().microsecond.toString();
                    databaseReference.child(id).set({
                      'WS_ID': nameController.text.toString(),
                      'Dustbin_Level': levelController.text.toString(),
                      'lat': latController.text.toString(),
                      'log': logController.text.toString(),
                      'id': id //It's give the unique id every time.
                    });
                    // For clear the controller
                    nameController.clear();
                    levelController.clear();
                    latController.clear();
                    logController.clear();
                    //For Dismiss the keyboard afte adding items
                    Navigator.pop(context);
                  },
                  child: const Text("Add"))
            ],
          ),
        );
      });
}
