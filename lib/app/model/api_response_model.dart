abstract class ApiResponseModel {
  final int statusCode;
  final dynamic data;

  ApiResponseModel({required this.statusCode, this.data});
}

class Success extends ApiResponseModel {
  Success({
    required super.statusCode,
    super.data,
  });
}

class Failure extends ApiResponseModel {
  Failure({
    required super.statusCode,
    super.data,
  });
}

extension ApiResponseModelExt on ApiResponseModel {
  bool get hasFailed {
    return this is Failure || data['success'] == false || data['status'] == 500;
  }
}
