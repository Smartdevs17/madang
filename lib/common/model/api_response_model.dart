import 'dart:convert';

class ApiResponseModel {
  final bool success;
  final String message;
  final dynamic data;

  ApiResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  ApiResponseModel copyWith({
    bool? sucess,
    String? message,
    dynamic data,
  }) {
    return ApiResponseModel(
        success: success,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data,
    };
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      success: map['success'] as bool,
      message: map['message'] as String,
      data: map['data' as dynamic],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
