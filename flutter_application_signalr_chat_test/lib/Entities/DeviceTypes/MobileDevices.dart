import 'package:schedule_t/Entities/Device.dart';

class MobileDevice extends Device {
  final int mobileDeviceID;
  final double screenSize;
  final int batteryLife;
  final bool biometricSecurity;

  MobileDevice({
    required this.mobileDeviceID,
    required this.screenSize,
    required this.batteryLife,
    required this.biometricSecurity,
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
  factory MobileDevice.fromJson(Map<String, dynamic> json) {
    
    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }   
    
    return MobileDevice(
      mobileDeviceID: json['MobileDeviceID'] as int,
      screenSize: json['ScreenSize'] as double,
      batteryLife: json['BatteryLife'] as int,
      biometricSecurity: json['BiometricSecurity'] as bool,
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
    print('Mobile Device ID: $mobileDeviceID');
    print('Screen Size: $screenSize');
    print('Battery Life: $batteryLife');
    print('Biometric Security: ${biometricSecurity ? 'Yes' : 'No'}');
  }
}
