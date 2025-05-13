class StaffLoginResponse {
  final List<dynamic> jobId;
  final List<dynamic> skillId;
  final String email;
  final String otp;
  final bool accountVerification;
  final bool isTermsAccepted;
  final String role;
  final String userType;
  final int wallet;
  final List<dynamic> expertise;
  final List<dynamic> roleIds;
  final String id;
  final List<dynamic> contactPreference;
  final DateTime createdAt;
  final DateTime updatedAt;

  StaffLoginResponse({
    required this.jobId,
    required this.skillId,
    required this.email,
    required this.otp,
    required this.accountVerification,
    required this.isTermsAccepted,
    required this.role,
    required this.userType,
    required this.wallet,
    required this.expertise,
    required this.roleIds,
    required this.id,
    required this.contactPreference,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StaffLoginResponse.fromJson(Map<String, dynamic> json) {
    return StaffLoginResponse(
      jobId: json['jobId'] ?? [],
      skillId: json['skillId'] ?? [],
      email: json['email'] ?? '',
      otp: json['otp'] ?? '',
      accountVerification: json['accountVerification'] ?? false,
      isTermsAccepted: json['isTermsAccepted'] ?? false,
      role: json['role'] ?? '',
      userType: json['userType'] ?? '',
      wallet: json['wallet'] ?? 0,
      expertise: json['expertise'] ?? [],
      roleIds: json['roleIds'] ?? [],
      id: json['_id'] ?? '',
      contactPreference: json['contactPreference'] ?? [],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
