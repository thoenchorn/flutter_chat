import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.textColor,
    this.onTap,
    this.icon,
  });

  final String title;
  final String subtitle;
  final Widget? trailing;
  final Color? textColor;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColor.secondaryContainer.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: textColor ?? AppColor.primary),
        ),
        title: Text(
          title,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        trailing:
            trailing ??
            const Icon(IconlyLight.arrow_right_2, color: Colors.grey, size: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        onTap: onTap,
      ),
    );
  }
}
