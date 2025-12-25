import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  // Controllers
  final TextEditingController _editUserNameController = TextEditingController();
  final TextEditingController _editEmailAddressController =
      TextEditingController();
  final TextEditingController _editPasswordController = TextEditingController();

  @override
  void dispose() {
    _editUserNameController.dispose();
    _editEmailAddressController.dispose();
    _editPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: KAppBar(
        centerTitle: true,
        title: "Edit Personal Info",
        onBack: () {
          // Back
          GoRouter.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username TextForm Field
              KTextFormField(
                    controller: _editUserNameController,
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
                  )
                  .animate()
                  .fadeIn(delay: 40.ms)
                  .slideY(begin: -0.5, end: 0, curve: Curves.easeIn),

              const SizedBox(height: 24),

              // Email Address TextForm Field
              KTextFormField(
                    controller: _editEmailAddressController,
                    hintText: "Enter email address",
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    suffixIcon: Icon(
                      Icons.alternate_email_outlined,
                      color: AppColors.subTitleColor,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 80.ms)
                  .slideY(begin: -0.5, end: 0, curve: Curves.easeIn),

              const SizedBox(height: 24),

              // Password TextForm Field
              KPasswordTextFormField(
                    controller: _editPasswordController,
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
                  )
                  .animate()
                  .fadeIn(delay: 120.ms)
                  .slideY(begin: -0.5, end: 0, curve: Curves.easeIn),

              const Spacer(flex: 1),

              KFilledBtn(
                    btnTitle: "Save Profile",
                    btnBgColor: AppColors.primaryColor,
                    btnTitleColor: AppColors.bgColor,
                    onTap: () {
                      // Recovery Screen
                    },
                    borderRadius: 30,
                    fontSize: 16,
                    btnHeight: 55,
                    btnWidth: double.maxFinite,
                  )
                  .animate()
                  .fadeIn(delay: 160.ms)
                  .slideY(begin: -0.5, end: 0, curve: Curves.easeIn),
            ],
          ),
        ),
      ),
    );
  }
}
