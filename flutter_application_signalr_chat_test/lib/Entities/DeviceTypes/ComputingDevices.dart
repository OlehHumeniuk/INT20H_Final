import 'package:schedule_t/Entities/Device.dart';

class ComputingDevice extends Device {
  final int computingDeviceID;
  final int ramSize;
  final int storageSize;
  final bool hasAntivirus;

  ComputingDevice({
    required this.computingDeviceID,
    required this.ramSize,
    required this.storageSize,
    required this.hasAntivirus,
    required int deviceID,
    required int osID,
    required String brandName,
    required String deviceIsSecure,
    required String osVersion,
    required bool osIsSecure,
    required String knownVulnerabilities,
    required String deviceModel,
    required String deviceImagePath,
    required List<String> signalTypes,
  }) : super(
          deviceID: deviceID,
          osID: osID,
          brandName: brandName,
          deviceIsSecure: deviceIsSecure,
          osVersion: osVersion,
          osIsSecure: osIsSecure,
          knownVulnerabilities: knownVulnerabilities,
          deviceModel: deviceModel,
          deviceImagePath: deviceImagePath,
          signalTypes: signalTypes,
        );

  @override
  factory ComputingDevice.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }

    return ComputingDevice(
      computingDeviceID: json['ComputingDeviceID'] as int,
      ramSize: json['RAMSize'] as int,
      storageSize: json['StorageSize'] as int,
      hasAntivirus: json['HasAntivirus'] as bool,
      deviceID: json['DeviceID'] as int,
      osID: json['OSID'] as int,
      brandName: json['BrandName'] as String,
      deviceIsSecure: json['DeviceIsSecure'] as String,
      osVersion: json['OSVersion'] as String,
      osIsSecure: json['OSIsSecure'] as bool,
      knownVulnerabilities: json['KnownVulnerabilities'] as String,
      deviceModel: json['DeviceModel'] as String,
      deviceImagePath: json['DeviceImagePath'] as String,
      signalTypes: signalTypesList,
    );
  }

  @override
  void printDeviceInfo() {
    super.printDeviceInfo();
    print('Computing Device ID: $computingDeviceID');
    print('Device Model: $deviceModel');
    print('RAM Size: $ramSize GB');
    print('Storage Size: $storageSize GB');
    print('Has Antivirus: ${hasAntivirus ? 'Yes' : 'No'}');
  }
}