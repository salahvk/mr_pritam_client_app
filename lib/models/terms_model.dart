class TermsData {
  final String id;
  final String terms;
  final String type;

  TermsData({
    required this.id,
    required this.terms,
    required this.type,
  });

  factory TermsData.fromJson(Map<String, dynamic> json) {
    return TermsData(
      id: json['_id'],
      terms: json['terms'].replaceAll('"', ''),
      type: json['type'],
    );
  }
}