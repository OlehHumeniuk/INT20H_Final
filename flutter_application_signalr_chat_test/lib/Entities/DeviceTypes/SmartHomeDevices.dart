import 'package:schedule_t/Entities/Device.dart';

class SmartHomeDevice extends Device {
  final int smartHomeDeviceID;
  final String connectivityType;
  final String compatibleAssistants;
  final bool energyStarRated;
  final bool remoteAccess;

  SmartHomeDevice({
    required this.smartHomeDeviceID,
    required this.connectivityType,
    required this.compatibleAssistants,
    required this.energyStarRated,
    required this.remoteAccess,
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
  factory SmartHomeDevice.fromJson(Map<String, dynamic> json) {

    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }  


    return SmartHomeDevice(
      smartHomeDeviceID: json['SmartHomeDevicesID'] as int,
      connectivityType: json['ConnectivityType'] as String,
      compatibleAssistants: json['CompatibleAssistants'] as String,
      energyStarRated: json['EnergyStarRated'] as bool,
      remoteAccess: json['RemoteAccess'] as bool,
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
    print('Smart Home Device ID: $smartHomeDeviceID');
    print('Connectivity Type: $connectivityType');
    print('Compatible Assistants: $compatibleAssistants');
    print('Energy Star Rated: ${energyStarRated ? 'Yes' : 'No'}');
    print('Remote Access: ${remoteAccess ? 'Yes' : 'No'}');
  }
}
