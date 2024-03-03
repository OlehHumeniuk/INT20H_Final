import 'package:schedule_t/Entities/Device.dart';

class EducationalDevice extends Device {
  final int educationalDeviceID;
  final String educationalContentSecurity;
  final String userAgeVerification;
  final bool deviceMonitoringCapabilities;
  final bool remoteManagement;

  EducationalDevice({
    required this.educationalDeviceID,
    required this.educationalContentSecurity,
    required this.userAgeVerification,
    
    required this.deviceMonitoringCapabilities,
    required this.remoteManagement,
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
  factory EducationalDevice.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }

    return EducationalDevice(
      educationalDeviceID: json['EducationalDeviceID'] as int,
      educationalContentSecurity: json['EducationalContentSecurity'] as String,
      userAgeVerification: json['UserAgeVerification'] as String,
      deviceMonitoringCapabilities: json['DeviceMonitoringCapabilities'] as bool,
      remoteManagement: json['RemoteManagement'] as bool,
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
    print('Educational Device ID: $educationalDeviceID');
    print('Educational Content Security: $educationalContentSecurity');
    print('User Age Verification: $userAgeVerification');
    print(
        'Device Monitoring Capabilities: ${deviceMonitoringCapabilities ? 'Yes' : 'No'}');
    print('Remote Management: ${remoteManagement ? 'Yes' : 'No'}');
  }
}