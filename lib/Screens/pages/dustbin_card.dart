import 'package:flutter/material.dart';

class DustbinCard extends StatelessWidget {
  final String wsId;
  final String dustbinLevel;
  final String location;

  const DustbinCard({
    Key? key,
    required this.dustbinLevel,
    required this.wsId,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine color based on dustbin level
    Color dustbinColor;
    print(dustbinLevel);
    var level = num.parse(dustbinLevel);
    if (level > 85) {
      dustbinColor = Colors.red;
    } else if (level > 25) {
      dustbinColor = Colors.yellow;
    } else {
      dustbinColor = Colors.green;
    }

    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Dustbin icon
            Icon(
              Icons.delete,
              color: dustbinColor,
              size: 100.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'WS ID: $wsId',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Dustbin Level: $dustbinLevel',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Location: $location',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
