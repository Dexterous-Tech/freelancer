import 'package:dio/dio.dart';
import 'package:freelancer/features/auth/data/models/verify_model.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/new_password_screen/data/models/new_password_model.dart';
import 'package:freelancer/features/auth/signup/data/models/signup_models.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/models/auth_action_response_model.dart';
import '../../features/auth/login/data/models/login_models.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBodyModel body);

  @POST(ApiConstants.forgetPassword)
  Future<AuthActionResponseModel> forgetPassword(
    @Body() ForgetPasswordRequestBodyModel body,
  );

  @POST(ApiConstants.verifyOtp)
  Future<AuthActionResponseModel> verifyForget(
    @Body() VerifyRequestBodModel body,
    @Query('for_reset_password') String forResetPassword,
  );

  @POST(ApiConstants.resendOtp)
  Future<AuthActionResponseModel> resendOtp(
    @Body() ForgetPasswordRequestBodyModel body,
  );

  @POST(ApiConstants.resetPassword)
  Future<AuthActionResponseModel> resetPassword(
    @Body() NewPasswordRequestBodyModel body,
  );

  @POST(ApiConstants.register)
  Future<AuthActionResponseModel> register(@Body() SignupRequestBodyModel body);

  @POST(ApiConstants.verifyOtp)
  Future<AuthActionResponseModel> verifyRegister(
    @Body() VerifyRequestBodModel body,
  );
}
