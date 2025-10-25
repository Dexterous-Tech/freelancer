import 'package:dio/dio.dart';
import 'package:freelancer/core/widgets/data/models/settings_model.dart';
import 'package:freelancer/features/auth/data/models/verify_model.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/new_password_screen/data/models/new_password_model.dart';
import 'package:freelancer/features/auth/signup/data/models/signup_models.dart';
import 'package:freelancer/features/client/change_password/data/models/change_password_model.dart';
import 'package:freelancer/features/client/edit_profile/data/models/update_profile_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/models/auth_action_response_model.dart';
import '../../features/auth/login/data/models/login_models.dart';
import '../../features/client/profile/data/models/profile_models.dart';
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

  @POST(ApiConstants.logout)
  Future<AuthActionResponseModel> logout();

  @DELETE(ApiConstants.deleteAccount)
  Future<AuthActionResponseModel> deleteAccount(
    @Body() DeleteAccountBodyModel body,
  );

  @GET(ApiConstants.getProfile)
  Future<ProfileResponseModel> getProfile();

  @POST(ApiConstants.updateFcmToken)
  Future<AuthActionResponseModel> updateFcmToken(
    @Body() UpdateFcmTokenRequestBodyModel body,
  );

  @POST(ApiConstants.changePassword)
  Future<AuthActionResponseModel> changePassword(
    @Body() ChangePasswordRequestBodyModel body,
  );

  @PATCH(ApiConstants.updateProfile)
  Future<ProfileResponseModel> updateProfile(
    @Body() UpdateProfileRequestBodyModel body,
  );

  // settings
  @GET(ApiConstants.aboutUs)
  Future<SettingsResponseModel> aboutUs();

  @GET(ApiConstants.termsConditions)
  Future<SettingsResponseModel> termsConditions();

  @POST(ApiConstants.verifyOtp)
  Future<AuthActionResponseModel> verifyUpdateProfile(
    @Body() VerifyRequestBodModel body,
    @Query('for_change_password') String forChanePassword,
  );
}
