import 'package:flutter/material.dart';
import 'dart:ui'; 
import 'package:provider/provider.dart';

import 'package:schedule_t/Entities/DeviceTypes.dart';
import 'package:schedule_t/DataLayer/DevicesProvider.dart';

class DeviceTypesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assume DevicesProvider is correctly set up higher in the widget tree
    var deviceTypesProvider = Provider.of<DevicesProvider>(context);

    return ListView.builder(
      itemCount: deviceTypesProvider.deviceTypes.length,
      itemBuilder: (context, index) {
        return DeviceTypeCard(deviceType: deviceTypesProvider.deviceTypes[index]);
      },
    );
  }
}

class DeviceTypeCard extends StatelessWidget {
  final DeviceTypes deviceType;

  DeviceTypeCard({Key? key, required this.deviceType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              deviceType.imagePath,
              height: 100, // Set a fixed height for simplicity
              width: double.infinity, // Make the image take the full width of the card
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              deviceType.deviceTypeName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}