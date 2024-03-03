import 'package:schedule_t/Entities/Device.dart';

class OfficeEquipment extends Device {
  final int officeEquipmentID;
  final String networkConnectivity;
  final String documentSecurityFeatures;
  final String userAuthentication;
  final String accessLogs;

  OfficeEquipment({
    required this.officeEquipmentID,
    required this.networkConnectivity,
    required this.documentSecurityFeatures,
    required this.userAuthentication,
    required this.accessLogs,
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
  factory OfficeEquipment.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }  

    return OfficeEquipment(
      officeEquipmentID: json['OfficeEquipmentID'] as int,
      networkConnectivity: json['NetworkConnectivity'] as String,
      documentSecurityFeatures: json['DocumentSecurityFeatures'] as String,
      userAuthentication: json['UserAuthentication'] as String,
      accessLogs: json['AccessLogs'] as String,
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
    print('Office Equipment ID: $officeEquipmentID');
    print('Network Connectivity: $networkConnectivity');
    print('Document Security Features: $documentSecurityFeatures');
    print('User Authentication: $userAuthentication');
    print('Access Logs: $accessLogs');
  }
}