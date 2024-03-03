class DeviceTypes {
  final int deviceTypeID;
  final String deviceTypeName;
  final String imagePath;

  DeviceTypes({
    required this.deviceTypeID,
    required this.deviceTypeName,
    required this.imagePath,
  });

  factory DeviceTypes.fromJson(Map<String, dynamic> json) {
    return DeviceTypes(
      deviceTypeID: json['DeviceTypeID'] is int ? json['DeviceTypeID'] : (json['DeviceTypeID'] as num?)?.toInt() ?? 0,
      deviceTypeName: json['DeviceTypeName'] ?? 'Unknown',
      imagePath: json['ImagePath'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'DeviceTypeID': deviceTypeID,
      'DeviceTypeName': deviceTypeName,
      'ImagePath': imagePath,
    };
  }
}