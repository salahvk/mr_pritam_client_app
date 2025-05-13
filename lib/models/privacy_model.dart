class PrivacyData {
  final String id;
  final String privacy;
  final String type;

  PrivacyData({
    required this.id,
    required this.privacy,
    required this.type,
  });

  factory PrivacyData.fromJson(Map<String, dynamic> json) {
    return PrivacyData(
      id: json['_id'],
      privacy: json['privacy'].replaceAll('"', ''),
      type: json['type'],
    );
  }
}