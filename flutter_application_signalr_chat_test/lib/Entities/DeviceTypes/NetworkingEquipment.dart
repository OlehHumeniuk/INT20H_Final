import 'package:schedule_t/Entities/Device.dart';

class NetworkingEquipment extends Device {
  final int networkingEquipmentID;
  final bool supportsVPN;
  final int maxDataRate;
  final int portCount;
  final String firewallCapabilities;

  NetworkingEquipment({
    required this.networkingEquipmentID,
    required this.supportsVPN,
    required this.maxDataRate,
    required this.portCount,
    required this.firewallCapabilities,
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
  factory NetworkingEquipment.fromJson(Map<String, dynamic> json) {
    
    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }       
    
    return NetworkingEquipment(
      networkingEquipmentID: json['NetworkingEquipmentID'] as int,
      supportsVPN: json['SupportsVPN'] as bool,
      maxDataRate: json['MaxDataRate'] as int,
      portCount: json['PortCount'] as int,
      firewallCapabilities: json['FirewallCapabilities'] as String,
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
    print('Networking Equipment ID: $networkingEquipmentID');
    print('Supports VPN: ${supportsVPN ? 'Yes' : 'No'}');
    print('Max Data Rate: $maxDataRate');
    print('Port Count: $portCount');
    print('Firewall Capabilities: $firewallCapabilities');
  }
}