class Device {
  final int deviceID;
  final int osID;
  final String brandName;
  final String deviceIsSecure;
  final String osVersion;
  final bool osIsSecure;
  final String knownVulnerabilities;
  final String deviceModel;
  final String deviceImagePath;
  final List<String> signalTypes;

  Device({
    required this.deviceID,
    required this.osID,
    required this.brandName,
    required this.deviceIsSecure,
    required this.osVersion,
    required this.osIsSecure,
    required this.knownVulnerabilities,
    required this.deviceModel,
    required this.deviceImagePath,
    required this.signalTypes,
  });

  // Factory method for creating an instance from JSON
  factory Device.fromJson(Map<String, dynamic> json) {
    var signalTypesFromJson = json['SignalTypes'];
    List<String> signalTypesList = [];
    if (signalTypesFromJson != null) {
      signalTypesList = List<String>.from(signalTypesFromJson.whereType<String>());
    }

    return Device(
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

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'DeviceID': deviceID,
      'OSID': osID,
      'BrandName': brandName,
      'DeviceIsSecure': deviceIsSecure,
      'OSVersion': osVersion,
      'OSIsSecure': osIsSecure,
      'KnownVulnerabilities': knownVulnerabilities,
      'DeviceModel': deviceModel,
      'DeviceImagePath': deviceImagePath,
    };
  }

  void printDeviceInfo() {
    print('Device ID: $deviceID');
    print('Device Model: $deviceModel');
    print('OS ID: $osID');
    print('Brand Name: $brandName');
    print('Device Is Secure: $deviceIsSecure');
    print('OS Version: $osVersion');
    print('OS Is Secure: ${osIsSecure ? 'Yes' : 'No'}');
    print('Known Vulnerabilities: $knownVulnerabilities');
    print('Device Image Path: $deviceImagePath');
  }
}

