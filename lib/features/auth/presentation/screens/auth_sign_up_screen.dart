import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:meditation_app/core/utils/text_form_filed_validators.dart';
import 'package:meditation_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:meditation_app/features/auth/presentation/widgets/social_btn.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  // Controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Clear Controllers
  void clearAllControllers() {
    _userNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      // Title
                      KText(
                            maxLines: 2,
                            softWrap: true,
                            text: "Create you account",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: AppColors.titleColor,
                          )
                          .animate()
                          .fadeIn(delay: 40.ms)
                          .slideX(begin: -0.5, end: 0),

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
                      ),

                      const SizedBox(height: 20),

                      // Username TextForm Field
                      KTextFormField(
                        controller: _userNameController,
                        hintText: "Enter username",
                        keyboardType: TextInputType.name,
                        autofillHints: [
                          AutofillHints.username,
                          AutofillHints.newUsername,
                          AutofillHints.name,
                        ],
                        suffixIcon: Icon(
                          Icons.person_2_outlined,
                          color: AppColors.subTitleColor,
                        ),
                      ),

                      const SizedBox(height: 24),

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
                      ),

                      const SizedBox(height: 24),

                      // Password  TextForm Field
                      KPasswordTextFormField(
                        controller: _passwordController,
                        hintText: "Enter your password",
                        validator: TextFormFieldValidators.validatePassword,
                      ),

                      const SizedBox(height: 24),

                      // Confirm Password Controller
                      KPasswordTextFormField(
                        controller: _confirmPasswordController,
                        hintText: "Enter your confirm password",
                        validator: (value) =>
                            TextFormFieldValidators.validateConfirmPassword(
                              _passwordController.text,
                              value,
                            ),
                      ),

                      const SizedBox(height: 70),

                      // Sign Up Btn
                      BlocConsumer<EmailAuthBloc, EmailAuthState>(
                        listener: (context, state) {
                          if (state is EmailRegisterAuthSuccess) {
                            // Success toast
                            KSnackBar.success(
                              context,
                              state.emailAuthEntity.message,
                            );

                            // Recovery Screen
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(AppRouterConstants.recovery);

                            // Clear All Controllers
                            clearAllControllers();
                          } else if (state is EmailRegisterAuthFailure) {
                            // Failure toast
                            KSnackBar.error(context, state.message);
                          }
                        },
                        builder: (context, state) {
                          return KFilledBtn(
                            isLoading: state is EmailRegisterAuthLoading,
                            btnTitle: "Sign Up",
                            btnBgColor: AppColors.primaryColor,
                            btnTitleColor: AppColors.bgColor,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final connectivityState = context
                                    .read<ConnectivityBloc>()
                                    .state;

                                // Correct internet check
                                if (connectivityState is ConnectivityFailure ||
                                    (connectivityState is ConnectivitySuccess &&
                                        connectivityState.isConnected ==
                                            false)) {
                                  Future.microtask(() {
                                    KSnackBar.error(
                                      context,
                                      "No Internet Connection",
                                    );
                                  });
                                  return;
                                }

                                // Register Event
                                context.read<EmailAuthBloc>().add(
                                  RegisterWithEmailEvent(
                                    firstName: _userNameController.text.trim(),
                                    lastName: "",
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    confirmPassword: _confirmPasswordController
                                        .text
                                        .trim(),
                                    phoneNumber: "",
                                    profileImage: "",
                                  ),
                                );
                              }
                            },
                            borderRadius: 30,
                            fontSize: 16,
                            btnHeight: 55,
                            btnWidth: double.maxFinite,
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Already have an account text
                          KText(
                            maxLines: 1,
                            softWrap: true,
                            text: "Already have an account?",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.authFooterContent,
                          ),

                          // Log In Text Btn
                          TextButton(
                            onPressed: () {
                              // Auth Sign In Screen
                              GoRouter.of(
                                context,
                              ).pushNamed(AppRouterConstants.authSignIn);
                            },
                            child: KText(
                              maxLines: 1,
                              softWrap: true,
                              text: "Log In",
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
              ),
            ).animate().fadeIn(delay: 40.ms).slideY(begin: -0.5, end: 0),
          ],
        ),
      ),
    );
  }
}
