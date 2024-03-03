import 'package:schedule_t/Entities/Device.dart';

class HealthcareDevice extends Device {
  final int healthcareDeviceID;
  final String patientDataSecurity;
  final String regulatoryCompliance;
  final String dataEncryptionLevel;
  final bool emergencySupport;

  HealthcareDevice({
    required this.healthcareDeviceID,
    required this.patientDataSecurity,
    required this.regulatoryCompliance,
    required this.dataEncryptionLevel,
    required this.emergencySupport,
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
  factory HealthcareDevice.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }    
    
    return HealthcareDevice(
      healthcareDeviceID: json['HealthcareDeviceID'] as int,
      patientDataSecurity: json['PatientDataSecurity'] as String,
      regulatoryCompliance: json['RegulatoryCompliance'] as String,
      dataEncryptionLevel: json['DataEncryptionLevel'] as String,
      emergencySupport: json['EmergencySupport'] as bool,
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
    print('Healthcare Device ID: $healthcareDeviceID');
    print('Patient Data Security: $patientDataSecurity');
    print('Regulatory Compliance: $regulatoryCompliance');
    print('Data Encryption Level: $dataEncryptionLevel');
    print('Emergency Support: ${emergencySupport ? 'Yes' : 'No'}');
  }
}
