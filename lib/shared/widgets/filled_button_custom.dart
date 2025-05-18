import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilledButtonCustom extends StatelessWidget {
  const FilledButtonCustom({required this.text, super.key, this.onPressed});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: context.textTheme.labelLarge!.copyWith(color: Colors.white),
      ),
    );
  }
}
