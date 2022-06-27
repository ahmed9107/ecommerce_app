import 'package:ecommerce_app/utils/constants/routes.dart';
import 'package:ecommerce_app/view/screens/auth/login.dart';
import 'package:ecommerce_app/view/screens/auth/verify_code_signup.dart';
import 'package:flutter/material.dart';
import 'view/screens/auth/forget_password/forget_password.dart';
import 'view/screens/auth/forget_password/reset_password.dart';
import 'view/screens/auth/signup.dart';
import 'view/screens/auth/forget_password/success_reset_pass.dart';
import 'view/screens/auth/success_signup.dart';
import 'view/screens/auth/forget_password/verify_code.dart';
import 'view/screens/auth/verify_email.dart';
import 'view/screens/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  /// Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signup: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.verifyCodeSignUp: (context) => const SignupVerifyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.successResetPassword: (context) => const SuccessResetPass(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.verifyEmail: (context) => const VerifyEmail(),

  /// Onboarding
  AppRoute.onboarding: (context) => const Onboarding()
};
