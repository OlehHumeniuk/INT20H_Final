import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:schedule_t/DataLayer/DevicesProvider.dart';

import 'package:schedule_t/Entities/Device.dart';
// DeviceDetailsWidget that expects a specific Device object
class DeviceDetailsWidget extends StatelessWidget {
  final Device device;

  const DeviceDetailsWidget({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the device image
        if (device.deviceImagePath.isNotEmpty)
          Image.asset(device.deviceImagePath, width: 100, height: 100),

        // Display the security status
        Row(
          children: [
            if (device.deviceIsSecure == 'N/A')
              Icon(Icons.help_outline, color: Colors.grey)
            else if (device.deviceIsSecure == 'FALSE')
              Icon(Icons.dangerous, color: Colors.red)
            else if (device.deviceIsSecure == 'TRUE')
              Icon(Icons.check_circle_outline, color: Colors.green),
            Text(
              device.deviceIsSecure == 'N/A'
                  ? 'Unknown'
                  : device.deviceIsSecure == 'FALSE'
                      ? 'Danger'
                      : 'Safe',
            ),
          ],
        ),

        // Display the device model
        Text('Model: ${device.deviceModel}'),

        // Display the rest of the device details
        Text('Brand: ${device.brandName}'),
        Text('OS Version: ${device.osVersion}'),
        Text('OsIsSecure: ${device.osIsSecure}'),
        Text('Signal Types: ${device.signalTypes.join(', ')}'),
                // Display the rest of the device details
        Text('OsIsSecure: ${device.osIsSecure}'),
      ],
    );
  }
}


Device? findDeviceByID(BuildContext context, int deviceID) {
  final devicesProvider = Provider.of<DevicesProvider>(context, listen: false);
  
  // Assuming all specific device lists have a common base type of `Device`
  List<Device> allDevices = [
    ...devicesProvider.automotiveDevice.cast<Device>(),
    ...devicesProvider.computingDevice.cast<Device>(),
    ...devicesProvider.educationalDevice.cast<Device>(),
    ...devicesProvider.healthcareDevice.cast<Device>(),
    ...devicesProvider.industrialControlSystem.cast<Device>(),
    ...devicesProvider.ioTDevice.cast<Device>(),
    ...devicesProvider.mobileDevice.cast<Device>(),
    ...devicesProvider.networkingEquipment.cast<Device>(),
    ...devicesProvider.officeEquipment.cast<Device>(),
    ...devicesProvider.smartHomeDevice.cast<Device>(),
    ...devicesProvider.wearableTechnology.cast<Device>(),
  ];

  // Find the device with the matching deviceID
  return allDevices.firstWhere(
    (device) => device.deviceID == deviceID,

  );
}