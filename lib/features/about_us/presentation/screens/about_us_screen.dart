import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/commons/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';
import 'package:meditation_app/core/utils/utils.dart';
import 'package:meditation_app/features/about_us/about_us.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: KAppBar(
        centerTitle: true,
        title: "About Us",
        onBack: () {
          // Back
          GoRouter.of(context).pop();
        },
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Our Mission
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor.withOpacity(0.2),
                ),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Title
                    KText(
                      text: "Our Mission",
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),

                    // Sub Title
                    KText(
                      text:
                          ''' We’re dedicated to helping you build a peaceful and balanced lifestyle through guided meditation and mindful practices. Every session is designed to support your mental clarity, relaxation, and emotional well-being.

Our goal is to make mindfulness simple, accessible, and meaningful—so you can reconnect with yourself anytime, anywhere.''',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      color: AppColors.subTitleParaColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Meet the Team
              KText(
                text: "Meet the Team",
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColors.titleColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),

              const SizedBox(height: 20),

              AboutUsTeamCard(
                name: "Imran B",
                designation: "Lead Front End Engineer",
                onTap: () {
                  UrlLauncherUtils.launchUrlLink(
                    AppContentConstants.imranPortFolio,
                  );
                },
                profileImage:
                    "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
              const SizedBox(height: 15),

              AboutUsTeamCard(
                name: "Manikandan K",
                designation: "Lead Back End Engineer",
                onTap: () {
                  UrlLauncherUtils.launchUrlLink(
                    AppContentConstants.maniKandanPortFolio,
                  );
                },
                profileImage:
                    "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),

              const SizedBox(height: 15),

              AboutUsTeamCard(
                name: "Anirudhane V",
                designation: "Content Writer",
                onTap: () {
                  UrlLauncherUtils.launchUrlLink(
                    AppContentConstants.anirudhaneVPotFolio,
                  );
                },
                profileImage:
                    "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
