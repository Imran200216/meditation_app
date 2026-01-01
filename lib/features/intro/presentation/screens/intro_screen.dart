import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_snack_bar.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_db_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/service/apple_auth_service.dart';
import 'package:meditation_app/core/service/google_auth_service.dart';
import 'package:meditation_app/core/service/hive_service.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/intro/presentation/bloc/login/login_bloc.dart';
import 'package:meditation_app/features/intro/presentation/widgets/social_btn.dart';
import 'package:meditation_app/providers/app_bloc_provider_extension.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                  flex: 10,
                  child: SvgPicture.asset(
                    AppAssetsConstants.intro,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                )
                .animate()
                .slideY(
                  begin: -0.5,
                  end: 0,
                  duration: 700.ms,
                  curve: Curves.easeIn,
                )
                .fadeIn(),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  KText(
                        maxLines: 2,
                        softWrap: true,
                        text: "We are What we do",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: AppColors.titleColor,
                      )
                      .animate()
                      .fadeIn(delay: 40.ms, curve: Curves.easeIn)
                      .slideX(begin: -0.5, end: 0),

                  const SizedBox(height: 14),

                  // Sub Title
                  KText(
                        maxLines: 2,
                        softWrap: true,
                        text:
                            "Thousands of people are using silent moon fo smalls meditation",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTitleColor,
                      )
                      .animate()
                      .fadeIn(delay: 80.ms, curve: Curves.easeIn)
                      .slideX(begin: -0.5, end: 0),

                  const SizedBox(height: 30),

                  // Continue with Google Btn
                  MultiBlocListener(
                    listeners: [
                      // Login Bloc
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            context.readGetUserAuthDetailsBloc.add(
                              GetUserByIdAuthEvent(
                                userId: state.loginEntity.user,
                              ),
                            );

                            KSnackBar.success(context, "Login Successful");
                          }

                          if (state is LoginFailure) {
                            KSnackBar.error(context, state.message);
                          }
                        },
                      ),

                      BlocListener<
                        GetUserAuthDetailsBloc,
                        GetUserAuthDetailsState
                      >(
                        listenWhen: (previous, current) =>
                            current is GetUserAuthDetailsSuccess &&
                            previous is! GetUserAuthDetailsSuccess,
                        listener: (context, state) async {
                          final user =
                              (state as GetUserAuthDetailsSuccess).userEntity;

                          await HiveService.saveData(
                            boxName: AppDbConstants.userBox,
                            key: AppDbConstants.userKey,
                            value: {
                              "id": user.id,
                              "profile_image": user.profileImage,
                              "first_name": user.firstName,
                              "last_name": user.lastName,
                              "email": user.email,
                              "phone_number": user.phoneNumber,
                            },
                          );

                          await HiveService.saveData(
                            boxName: AppDbConstants.userBox,
                            key: AppDbConstants.userAuthLoggedStatus,
                            value: true,
                          );

                          if (!context.mounted) return;

                          GoRouter.of(
                            context,
                          ).pushReplacementNamed(AppRouterConstants.bottomNav);
                        },
                      ),
                    ],
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return SocialBtn(
                          isLoading: state is LoginLoading,
                          btnHeight: 55,
                          btnTitle: "Continue into Google",
                          borderRadius: 30,
                          borderColor: AppColors.socialBtnBorderColor,
                          bgColor: AppColors.bgColor,
                          textColor: AppColors.titleColor,
                          svgIcon: AppAssetsConstants.google,
                          btnWidth: double.maxFinite,
                          onTap: () async {
                            final connectivityState =
                                context.readConnectivityBloc.state;

                            if (connectivityState is ConnectivityFailure ||
                                (connectivityState is ConnectivitySuccess &&
                                    !connectivityState.isConnected)) {
                              KSnackBar.error(
                                context,
                                "No Internet Connection",
                              );
                              return;
                            }

                            final googleAuthService = GoogleAuthService();

                            final user = await googleAuthService.signIn();

                            if (user != null) {
                              LoggerUtils.logInfo(
                                "User: ${user.id}, ${user.name}, ${user.email}",
                              );

                              // Login Event
                              context.readLoginBloc.add(
                                LoginAuthEvent(
                                  firebaseUID: user.id,
                                  email: user.email,
                                  firstName: user.name,
                                ),
                              );
                            } else {
                              KSnackBar.error(context, "Something went wrong");
                            }
                          },
                        );
                      },
                    ),
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
                          onTap: () async {
                            final appleAuthService = AppleAuthService();

                            final appleAuthId = await appleAuthService
                                .getAppleAuthId();

                            LoggerUtils.logInfo('Apple Auth ID: $appleAuthId');
                          },
                          btnWidth: double.maxFinite,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
