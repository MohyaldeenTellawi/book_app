import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With Api Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Server');

      case DioExceptionType.cancel:
        return ServerFailure('Request To Api Server Was Canceled');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please Try Again!');
      default:
        return ServerFailure('Opps! There Was an Error, Please try Again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 429) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found, Please Try Later!');
    } else if(statusCode == 429){
      return ServerFailure('Quota exceeded for quota metric Queries and limit');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please Try Later!');
    } else {
      return ServerFailure('Opps! There Was an Error, Please try Again');
    }
  }
}
