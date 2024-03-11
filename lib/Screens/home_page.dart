import 'package:flutter/material.dart';
import 'package:waste_managemet_app/RealTimeDatabase_CRUD/real_tim_crud.dart';
import 'package:waste_managemet_app/Screens/aboutUs.dart';
import 'package:waste_managemet_app/Screens/homeInfo.dart';
import 'package:waste_managemet_app/Screens/maps_page.dart';
// import 'package:waste_managemet_app/Screens/read_sms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeInfo(),
    const MapWithMarkers(),
    const AboutUs(),
  ];

  final List<String> _title = ["Dashboard", "Map", "About Us"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Text(_title[_currentIndex]),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RealTimeCRUDEdatabase()));
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
          backgroundColor: const Color.fromARGB(255, 59, 217, 64),
          elevation: 50,
          shadowColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 59, 217, 64),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
