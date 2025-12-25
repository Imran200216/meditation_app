import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';
import 'package:meditation_app/features/auth/auth.dart';

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

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  ).animate().fadeIn(delay: 40.ms).slideX(begin: -0.5, end: 0),

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
                      Expanded(child: Divider(color: AppColors.subTitleColor)),

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

                      Expanded(child: Divider(color: AppColors.subTitleColor)),
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
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    suffixIcon: Icon(
                      Icons.alternate_email_outlined,
                      color: AppColors.subTitleColor,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Email Address TextForm Field
                  KPasswordTextFormField(
                    controller: _passwordController,
                    hintText: "Enter your password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 40.ms).slideY(begin: -0.5, end: 0),

            // Auth Footer
            Positioned(
              bottom: 30,
              right: 20,
              left: 20,
              child: Column(
                children: [
                  // Sign Up Btn
                  KFilledBtn(
                        btnTitle: "Sign Up",
                        btnBgColor: AppColors.primaryColor,
                        btnTitleColor: AppColors.bgColor,
                        onTap: () {
                          // Recovery Screen
                          GoRouter.of(
                            context,
                          ).pushReplacementNamed(AppRouterConstants.recovery);
                        },
                        borderRadius: 30,
                        fontSize: 16,
                        btnHeight: 55,
                        btnWidth: double.maxFinite,
                      )
                      .animate()
                      .fadeIn(delay: 120.ms)
                      .slideX(begin: -0.5, end: 0, curve: Curves.easeIn),

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
            ).animate().fadeIn(delay: 120.ms).slideX(begin: -0.5, end: 0),
          ],
        ),
      ),
    );
  }
}
