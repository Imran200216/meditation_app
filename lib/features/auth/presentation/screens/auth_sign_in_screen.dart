import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_filled_btn.dart';
import 'package:meditation_app/common/widgets/k_password_text_form_field.dart';
import 'package:meditation_app/common/widgets/k_snack_bar.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/common/widgets/k_text_form_field.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/core/utils/text_form_filed_validators.dart';
import 'package:meditation_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:meditation_app/features/auth/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/auth/presentation/widgets/social_btn.dart';

class AuthSignInScreen extends StatefulWidget {
  const AuthSignInScreen({super.key});

  @override
  State<AuthSignInScreen> createState() => _AuthSignInScreenState();
}

class _AuthSignInScreenState extends State<AuthSignInScreen> {
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Clear Controllers
  void clearAllControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Auth Bg
            Positioned(
              top: -60,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                AppAssetsConstants.authBg,
                fit: BoxFit.fitWidth,
              ),
            ).animate().fadeIn(delay: 40.ms).slideX(begin: -0.5, end: 0),

            // Controllers And Btn
            Positioned(
              top: 50,
              right: 20,
              left: 20,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Title
                    KText(
                      maxLines: 2,
                      softWrap: true,
                      text: "Welcome Back!",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.titleColor,
                    ),

                    const SizedBox(height: 40),

                    // Continue with Google Btn
                    SocialBtn(
                      btnHeight: 55,
                      btnTitle: "Continue into Google",
                      borderRadius: 30,
                      borderColor: AppColors.socialBtnBorderColor,
                      bgColor: AppColors.bgColor,
                      textColor: AppColors.titleColor,
                      svgIcon: AppAssetsConstants.google,
                      onTap: () {},
                      btnWidth: double.maxFinite,
                    ),

                    Platform.isIOS
                        ? const SizedBox(height: 20)
                        : SizedBox.shrink(),

                    // Continue with Apple Btn
                    Platform.isIOS
                        ? SocialBtn(
                            btnHeight: 55,
                            btnTitle: "Continue into Apple",
                            borderRadius: 30,
                            borderColor: AppColors.socialBtnBorderColor,
                            bgColor: AppColors.bgColor,
                            textColor: AppColors.titleColor,
                            svgIcon: AppAssetsConstants.apple,
                            onTap: () {},
                            btnWidth: double.maxFinite,
                          )
                        : SizedBox.shrink(),

                    const SizedBox(height: 40),

                    Row(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(color: AppColors.subTitleColor),
                            ),

                            // Or Log in with email
                            KText(
                              maxLines: 2,
                              softWrap: true,
                              text: "Or Log in with Email",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.subTitleColor,
                            ),

                            Expanded(
                              child: Divider(color: AppColors.subTitleColor),
                            ),
                          ],
                        )
                        .animate()
                        .fadeIn(delay: 80.ms)
                        .slideX(begin: -0.5, end: 0),

                    const SizedBox(height: 20),

                    // Email Address TextForm Field
                    KTextFormField(
                          controller: _emailController,
                          hintText: "Enter email address",
                          validator: TextFormFieldValidators.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          suffixIcon: Icon(
                            Icons.alternate_email_outlined,
                            color: AppColors.subTitleColor,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 120.ms)
                        .slideX(begin: -0.5, end: 0),

                    const SizedBox(height: 24),

                    // Email Address TextForm Field
                    KPasswordTextFormField(
                          controller: _passwordController,
                          hintText: "Enter your password",
                          validator: TextFormFieldValidators.validatePassword,
                        )
                        .animate()
                        .fadeIn(delay: 160.ms)
                        .slideX(begin: -0.5, end: 0),

                    const SizedBox(height: 70),

                    // Sign In Btn
                    MultiBlocListener(
                      listeners: [
                        BlocListener<EmailAuthBloc, EmailAuthState>(
                          listener: (context, state) {
                            if (state is EmailLoginAuthSuccess) {
                              KSnackBar.success(context, "Login Successful");

                              GoRouter.of(context).pushReplacementNamed(
                                AppRouterConstants.welcome,
                              );

                              clearAllControllers();
                            } else if (state is EmailLoginAuthFailure) {
                              KSnackBar.error(context, state.message);
                            }
                          },
                        ),

                        BlocListener<
                          GetUserAuthDetailsBloc,
                          GetUserAuthDetailsState
                        >(
                          listener: (context, state) {
                            if (state is GetUserAuthDetailsSuccess) {
                              final user = state.userEntity;

                              LoggerUtils.logInfo("The User details $user");

                              GoRouter.of(context).pushReplacementNamed(
                                AppRouterConstants.bottomNav,
                              );
                            } else if (state is GetUserAuthDetailsFailure) {}
                          },
                        ),
                      ],
                      child: BlocBuilder<EmailAuthBloc, EmailAuthState>(
                        builder: (context, emailAuthState) {
                          return KFilledBtn(
                            isLoading: emailAuthState is EmailLoginAuthLoading,
                            btnTitle: "Log In",
                            btnBgColor: AppColors.primaryColor,
                            btnTitleColor: AppColors.bgColor,
                            borderRadius: 30,
                            fontSize: 16,
                            btnHeight: 55,
                            btnWidth: double.maxFinite,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final connectivityState = context
                                    .read<ConnectivityBloc>()
                                    .state;

                                if (connectivityState is ConnectivityFailure ||
                                    (connectivityState is ConnectivitySuccess &&
                                        !connectivityState.isConnected)) {
                                  KSnackBar.error(
                                    context,
                                    "No Internet Connection",
                                  );
                                  return;
                                }

                                context.read<EmailAuthBloc>().add(
                                  LoginWithEmailEvent(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),

                    // Forget Password ?
                    TextButton(
                      onPressed: () {},
                      child: KText(
                        maxLines: 1,
                        softWrap: true,
                        text: "Forget Password?",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.titleColor,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Don't have an account text
                        KText(
                          maxLines: 1,
                          softWrap: true,
                          text: "Don't have an account?",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColors.authFooterContent,
                        ),

                        // Sign Up Text Btn
                        TextButton(
                          onPressed: () {
                            // Auth Sign Up Screen
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouterConstants.authSignUp);
                          },
                          child: KText(
                            maxLines: 1,
                            softWrap: true,
                            text: "Sign Up",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(delay: 40.ms).slideY(begin: -0.5, end: 0),
          ],
        ),
      ),
    );
  }
}
