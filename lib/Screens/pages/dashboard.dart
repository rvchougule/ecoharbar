import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shadowColor: Colors.grey,
                  elevation: 7,
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(252, 251, 251, 0.922)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Waste Collected",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                          Text(
                            "13.2 Tons",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.grey,
                  elevation: 7,
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(252, 251, 251, 0.922)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recycled Items",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                          Text(
                            "3.7 Tons",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shadowColor: Colors.grey,
                  elevation: 7,
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(252, 251, 251, 0.922)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Trash Bags",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                          Text(
                            "1.8 Tons",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.grey,
                  elevation: 7,
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(252, 251, 251, 0.922)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Compost Bags",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                          Text(
                            "6.4 Tons",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                shadowColor: Colors.grey,
                elevation: 7,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(252, 251, 251, 0.922)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bulk Items",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                        Text(
                          "1.3 Tons",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Last Pickup",
                        style:
                            TextStyle(color: Color.fromRGBO(98, 98, 98, 0.929)),
                      ),
                      Spacer(),
                      Text(
                        "2 days ago",
                        style:
                            TextStyle(color: Color.fromRGBO(98, 98, 98, 0.929)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Next Pickup",
                        style:
                            TextStyle(color: Color.fromRGBO(98, 98, 98, 0.929)),
                      ),
                      Spacer(),
                      Text(
                        "Tomorrow",
                        style:
                            TextStyle(color: Color.fromRGBO(98, 98, 98, 0.929)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Pickup Day",
                        style:
                            TextStyle(color: Color.fromRGBO(98, 98, 98, 0.929)),
                      ),
                      Spacer(),
                      Text(
                        "Saturday",
                        style:
                            TextStyle(color: Color.fromRGBO(98, 98, 98, 0.929)),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
