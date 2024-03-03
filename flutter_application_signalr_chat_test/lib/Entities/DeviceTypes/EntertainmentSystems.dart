import 'package:schedule_t/Entities/Device.dart';

class EntertainmentSystem extends Device {
  final int entertainmentSystemID;
  final String parentalControl;
  final bool firmwareIntegrityCheck;
  final String networkSecurity;
  final String contentEncryption;

  EntertainmentSystem({
    required this.entertainmentSystemID,
    required this.parentalControl,
    required this.firmwareIntegrityCheck,
    required this.networkSecurity,
    required this.contentEncryption,
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
  factory EntertainmentSystem.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }
    return EntertainmentSystem(
      entertainmentSystemID: json['EntertainmentSystemsID'] as int,
      parentalControl: json['ParentalControl'] as String,
      firmwareIntegrityCheck: json['FirmwareIntegrityCheck'] as bool,
      networkSecurity: json['NetworkSecurity'] as String,
      contentEncryption: json['ContentEncryption'] as String,
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
    print('Entertainment System ID: $entertainmentSystemID');
    print('Parental Control: $parentalControl');
    print('Firmware Integrity Check: ${firmwareIntegrityCheck ? 'Yes' : 'No'}');
    print('Network Security: $networkSecurity');
    print('Content Encryption: $contentEncryption');
  }
}
