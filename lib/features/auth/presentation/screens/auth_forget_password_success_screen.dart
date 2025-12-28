import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_filled_btn.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class AuthForgetPasswordSuccessScreen extends StatelessWidget {
  const AuthForgetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Forget Password Success Svg
              SvgPicture.asset(
                AppAssetsConstants.forgetPasswordSuccess,
                height: 240,
                width: 240,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 30),

              // Title
              KText(
                maxLines: 2,
                softWrap: true,
                text: "Password Reset Email Sent",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.titleColor,
              ),

              const SizedBox(height: 12),

              // Sub Title
              KText(
                maxLines: 6,
                softWrap: true,
                text:
                    "We've have sent a password reset link to your email. Click the link to securely reset your password. If you don't see the email, check your spam or junk folder.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.subTitleParaColor,
              ),

              const SizedBox(height: 50),

              KFilledBtn(
                btnTitle: "Back to Login",
                btnBgColor: AppColors.primaryColor,
                btnTitleColor: AppColors.bgColor,
                onTap: () {
                  // Auth Sign In Screen
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouterConstants.authSignIn);
                },
                borderRadius: 30,
                fontSize: 16,
                btnHeight: 55,
                btnWidth: double.maxFinite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
