// ignore_for_file: public_member_api_docs

class ErrorResponse {
  ErrorResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['status_message'] == null ||
        json['status_code'] == null ||
        json['success'] == null) {
      throw ArgumentError('Wrong json');
    }
    return ErrorResponse(
      success: json['success'] as bool,
      statusCode: json['status_code'] as int,
      statusMessage: json['status_message'] as String,
    );
  }
  bool success;
  int statusCode;
  String statusMessage;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    return data;
  }
}
