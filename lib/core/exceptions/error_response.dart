class ErrorResponse {
  bool? error;
  String? errorMesage;

  ErrorResponse({this.error, required this.errorMesage});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMesage = json['errorMesage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['errorMesage'] = errorMesage;
    return data;
  }
}
