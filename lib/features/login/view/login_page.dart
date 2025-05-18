import 'package:chat_flutter/features/navigation/view/navigation_page.dart';
import 'package:chat_flutter/shared/extensions/close_keyboard.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/widgets/filled_button_custom.dart';
import 'package:chat_flutter/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routePath = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.closeKeyboard(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                AppSpacing.verticalXXLG,
                Lottie.asset('assets/animation/login.json', height: 300),
                AppSpacing.verticalXLG,
                TextFieldCustom(
                  label: 'Phone Number',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                AppSpacing.verticalXXLG,
                TextFieldCustom(
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscureText,
                  textInputAction: TextInputAction.done,
                  onSuffixTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  suffix: obscureText ? IconlyLight.show : IconlyLight.hide,
                ),
                AppSpacing.verticalXXXL,
                FilledButtonCustom(
                  onPressed: () {
                    context.go(NavigationPage.routePath);
                  },
                  text: 'Sign In',
                ),
                AppSpacing.verticalXLG,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
