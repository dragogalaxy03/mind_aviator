class DeviceInfo {
  final String device;
  final String deviceModel;
  final String osVersion;
  final String serial;
  final String deviceId;
  final String assetType;

  DeviceInfo({
    required this.device,
    required this.deviceModel,
    required this.osVersion,
    required this.serial,
    required this.deviceId,
    required this.assetType,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      device: json['device'],
      deviceModel: json['deviceModel'],
      osVersion: json['osVersion'],
      serial: json['serial'],
      deviceId: json['device_id'],
      assetType: json['asset_type'],
    );
  }
}
