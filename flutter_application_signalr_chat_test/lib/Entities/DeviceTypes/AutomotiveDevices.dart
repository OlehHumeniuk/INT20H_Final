import 'package:schedule_t/Entities/Device.dart';

class AutomotiveDevice extends Device {
  final int automotiveDeviceID;
  final String vehicleCybersecurity;
  final String telematicsFeatures;
  final String ecuSecurity;
  final bool overTheAirUpdates;

  AutomotiveDevice({
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
    required this.automotiveDeviceID,
    required this.vehicleCybersecurity,
    required this.telematicsFeatures,
    required this.ecuSecurity,
    required this.overTheAirUpdates,
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
// Overriding the fromJson method to handle additional fields
  @override
  factory AutomotiveDevice.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }

    return AutomotiveDevice(
      automotiveDeviceID: json['AutomotiveDeviceID'] as int,
      vehicleCybersecurity: json['VehicleCybersecurity'] as String,
      telematicsFeatures: json['TelematicsFeatures'] as String,
      ecuSecurity: json['EcuSecurity'] as String,
      overTheAirUpdates: json['OverTheAirUpdates'] as bool,
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
    print('Automotive Device ID: $automotiveDeviceID');
    print('Vehicle Cybersecurity: $vehicleCybersecurity');
    print('Telematics Features: $telematicsFeatures');
    print('ECU Security: $ecuSecurity');
    print('Over-the-Air Updates: ${overTheAirUpdates ? 'Yes' : 'No'}');
  }
}

