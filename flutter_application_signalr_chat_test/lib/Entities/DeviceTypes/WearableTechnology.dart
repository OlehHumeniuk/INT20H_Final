import 'package:schedule_t/Entities/Device.dart';

class WearableTechnology extends Device {
  final int wearableTechnologyID;
  final String biometricDataSecurity;
  final String devicePairingSecurity;
  final String locationTrackingOption;
  final bool emergencySOS;

  WearableTechnology({
    required this.wearableTechnologyID,
    required this.biometricDataSecurity,
    required this.devicePairingSecurity,
    required this.locationTrackingOption,
    required this.emergencySOS,
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
  factory WearableTechnology.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }  

    return WearableTechnology(
      wearableTechnologyID: json['WearableTechnologyID'] as int,
      biometricDataSecurity: json['BiometricDataSecurity'] as String,
      devicePairingSecurity: json['DevicePairingSecurity'] as String,
      locationTrackingOption: json['LocationTrackingOption'] as String,
      emergencySOS: json['EmergencySOS'] as bool,
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
    print('Wearable Technology ID: $wearableTechnologyID');
    print('Biometric Data Security: $biometricDataSecurity');
    print('Device Pairing Security: $devicePairingSecurity');
    print('Location Tracking Option: $locationTrackingOption');
    print('Emergency SOS: ${emergencySOS ? 'Yes' : 'No'}');
  }
}