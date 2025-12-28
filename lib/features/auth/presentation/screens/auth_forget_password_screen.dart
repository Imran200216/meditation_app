import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_filled_btn.dart';
import 'package:meditation_app/common/widgets/k_snack_bar.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/common/widgets/k_text_form_field.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/text_form_filed_validators.dart';

class AuthForgetPasswordScreen extends StatefulWidget {
  const AuthForgetPasswordScreen({super.key});

  @override
  State<AuthForgetPasswordScreen> createState() =>
      _AuthForgetPasswordScreenState();
}

class _AuthForgetPasswordScreenState extends State<AuthForgetPasswordScreen> {
  // Controllers
  final TextEditingController _emailController = TextEditingController();

  // Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Clear Controllers
  void clearAllControllers() {
    _emailController.clear();
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

            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  // Back
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
                  color: AppColors.titleColor,
                ),
              ),
            ),

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
                      text: "Forget Password",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.titleColor,
                    ),

                    const SizedBox(height: 12),

                    KText(
                      maxLines: 2,
                      softWrap: true,
                      text: "Then let's reset your password.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subTitleParaColor,
                    ),

                    const SizedBox(height: 40),

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

                    const SizedBox(height: 40),

                    // Continue Btn
                    KFilledBtn(
                      btnTitle: "Continue",
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
                            KSnackBar.error(context, "No Internet Connection");
                            return;
                          }

                          GoRouter.of(context).pushReplacementNamed(
                            AppRouterConstants.authForgetPasswordSuccess,
                          );
                        }
                      },
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
