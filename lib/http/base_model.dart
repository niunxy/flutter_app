class BaseModel<T> {
  T? data;
  String? errorMsg;
  int? errorCode;

  BaseModel.fromJson(dynamic json) {
    data = json['data'];
    errorMsg = json['errorMsg'];
    errorCode = json['errorCode'];
  }
}

