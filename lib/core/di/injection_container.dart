import 'package:dio/dio.dart';
import 'package:freelancer/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:freelancer/features/auth/new_password_screen/data/repo/new_password_repo.dart';
import 'package:freelancer/features/auth/new_password_screen/presentation/manager/new_password_cubit.dart';
import 'package:freelancer/features/auth/signup/data/repo/signup_repo.dart';
import 'package:freelancer/features/auth/signup/presentation/manager/signup_cubit.dart';
import 'package:freelancer/features/auth/verification/data/repo/verification_repo.dart';
import 'package:freelancer/features/auth/verification/presentation/manager/verification_cubit.dart';
import 'package:freelancer/features/common/change_password/data/repo/change_password_repo.dart';
import 'package:freelancer/features/common/change_password/presentation/manager/change_password_cubit.dart';
import 'package:freelancer/features/client/edit_profile/data/repo/update_profile_repo.dart';
import 'package:freelancer/features/client/edit_profile/presentation/manager/client_edit_profile_cubit.dart';
import 'package:freelancer/features/client/join_us/presentation/manager/join_us_cubit.dart';
import 'package:freelancer/features/client/profile/data/repo/profile_repo.dart';
import 'package:freelancer/features/client/profile/presentation/manager/profile_cubit.dart';
import 'package:freelancer/features/common/contact_us/presentation/manager/contact_us_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/common/about_us/data/about_us_repo.dart';
import '../../features/common/about_us/presentation/manager/about_us_cubit.dart';
import '../../features/auth/forget_password/data/repo/verify_forget_repo.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/widgets/resend_code/data/repo/resend_code_repo.dart';
import '../../features/auth/widgets/resend_code/manager/resend_code_cubit.dart';
import '../../features/common/privacy_policy/data/privacy_policy_repo.dart';
import '../../features/common/privacy_policy/presentation/manager/privacy_policy_cubit.dart';
import '../../features/common/request_speciality/presentation/manager/request_speciality_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize Dio using DioFactory
  final dio = await DioFactory.getDio();

  // Register Dio as a singleton first
  sl.registerSingleton<Dio>(dio);

  // Register ApiServices as a singleton
  sl.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // login
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));

  // forget password
  sl.registerLazySingleton<VerifyForgetRepo>(() => VerifyForgetRepo(sl()));
  sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));

  // resend code
  sl.registerLazySingleton<ResendCodeRepo>(() => ResendCodeRepo(sl()));
  sl.registerFactory<ResendCodeCubit>(() => ResendCodeCubit(sl()));

  // reset password
  sl.registerLazySingleton<NewPasswordRepo>(() => NewPasswordRepo(sl()));
  sl.registerFactory<NewPasswordCubit>(() => NewPasswordCubit(sl()));

  // register
  sl.registerLazySingleton<SignupRepo>(() => SignupRepo(sl()));
  sl.registerFactory<SignupCubit>(() => SignupCubit(sl()));

  // verification
  sl.registerLazySingleton<VerificationRepo>(() => VerificationRepo(sl()));
  sl.registerFactory<VerificationCubit>(() => VerificationCubit(sl()));

  // profile
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepo(sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));

  // about us
  sl.registerLazySingleton<AboutUsRepo>(() => AboutUsRepo(sl()));
  sl.registerFactory<AboutUsCubit>(() => AboutUsCubit(sl()));

  // privacy policy
  sl.registerLazySingleton<PrivacyPolicyRepo>(() => PrivacyPolicyRepo(sl()));
  sl.registerFactory<PrivacyPolicyCubit>(() => PrivacyPolicyCubit(sl()));

  // change password
  sl.registerLazySingleton<ChangePasswordRepo>(() => ChangePasswordRepo(sl()));
  sl.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(sl()));

  // update profile
  sl.registerLazySingleton<UpdateProfileRepo>(() => UpdateProfileRepo(sl()));
  sl.registerFactory<ClientEditProfileCubit>(
    () => ClientEditProfileCubit(sl()),
  );

  // join us
  sl.registerFactory<JoinUsCubit>(() => JoinUsCubit());

  // contact us
  sl.registerFactory<ContactUsCubit>(() => ContactUsCubit());

  // request speciality
  sl.registerFactory<RequestSpecialityCubit>(() => RequestSpecialityCubit());
}
