import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/login/data/models/login_models.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBodyModel body);
}
