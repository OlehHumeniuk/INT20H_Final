import 'package:schedule_t/Entities/Device.dart';

class IoTDevice extends Device {
  final int ioTDeviceID;
  final String ioTSecurity;
  final String connectivityProtocols;
  final String updateMechanism;
  final String dataCollectionPolicy;

  IoTDevice({
    required this.ioTDeviceID,
    required this.ioTSecurity,
    required this.connectivityProtocols,
    required this.updateMechanism,
    required this.dataCollectionPolicy,
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
  factory IoTDevice.fromJson(Map<String, dynamic> json) {
    
    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }   
    
    return IoTDevice(
      ioTDeviceID: json['IoTDevicesID'] as int,
      ioTSecurity: json['IoTSecurity'] as String,
      connectivityProtocols: json['ConnectivityProtocols'] as String,
      updateMechanism: json['UpdateMechanism'] as String,
      dataCollectionPolicy: json['DataCollectionPolicy'] as String,
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
    print('IoT Device ID: $ioTDeviceID');
    print('IoT Security: $ioTSecurity');
    print('Connectivity Protocols: $connectivityProtocols');
    print('Update Mechanism: $updateMechanism');
    print('Data Collection Policy: $dataCollectionPolicy');
  }
}
