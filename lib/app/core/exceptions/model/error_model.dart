class ErrorModel {
  final String? title;
  final String? error;
  final String? errorDescription;
  final int? statusCode;

  const ErrorModel({
    this.title,
    this.error,
    this.errorDescription,
    this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      title: json['title'] as String?,
      error: json['error'] as String?,
      errorDescription: json['error_description'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'error': error,
    'error_description': errorDescription,
    'statusCode': statusCode,
  };
}
