class BaseModel<E> {
  int status;
  bool success;
  E? data;
  E? message;

  BaseModel(
      {required this.status, required this.success, this.data, this.message});

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json['status'],
        success: json['success'] ?? false,
        data: json['data'],
        message: json['message'] ?? "",
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
