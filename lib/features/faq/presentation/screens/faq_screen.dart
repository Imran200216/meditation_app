import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/commons/widgets/widgets.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/faq/faq.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: KAppBar(
        centerTitle: true,
        title: "Frequently Asked Questions",
        onBack: () {
          // Back
          GoRouter.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 40,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return FaqExpansionTile(
                faqTitle: "What is StreetNosh?",
                faqDescription:
                    "We need your location to show nearby restaurants and deliver your orders faster.",
              );
            },
          ),
        ),
      ),
    );
  }
}
