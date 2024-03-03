import 'package:schedule_t/Entities/Device.dart';

class IndustrialControlSystem extends Device {
  final int industrialControlSystemID;
  final String scadaSecurity;
  final String physicalSafetyFeatures;
  final bool networkIsolation;
  final bool regularUpdatesSupport;

  IndustrialControlSystem({
    required this.industrialControlSystemID,
    required this.scadaSecurity,
    required this.physicalSafetyFeatures,
    required this.networkIsolation,
    required this.regularUpdatesSupport,
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
  factory IndustrialControlSystem.fromJson(Map<String, dynamic> json) {
    
    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }    
    
    return IndustrialControlSystem(
      industrialControlSystemID: json['IndustrialControlSystemID'] as int,
      scadaSecurity: json['SCADASecurity'] as String,
      physicalSafetyFeatures: json['PhysicalSafetyFeatures'] as String,
      networkIsolation: json['NetworkIsolation'] as bool,
      regularUpdatesSupport: json['RegularUpdatesSupport'] as bool,
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
    print('Industrial Control System ID: $industrialControlSystemID');
    print('SCADA Security: $scadaSecurity');
    print('Physical Safety Features: $physicalSafetyFeatures');
    print('Network Isolation: ${networkIsolation ? 'Yes' : 'No'}');
    print('Regular Updates Support: ${regularUpdatesSupport ? 'Yes' : 'No'}');
  }
}
