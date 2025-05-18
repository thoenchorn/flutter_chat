import 'dart:math';

import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:chat_flutter/shared/widgets/custom_avatar.dart';
import 'package:flutter/material.dart';

class ItemChat extends StatelessWidget {
  const ItemChat({
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    super.key,
    this.isMessageRead = false,
    this.online = false,
    this.onTap,
    this.countMessage,
  });

  final int id;
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  final bool isMessageRead;
  final bool online;
  final int? countMessage;
  final VoidCallback? onTap;

  String _getRandomColor() {
    // Generate random RGB values (0-255)
    final random = Random();
    final r = random.nextInt(256).toRadixString(16).padLeft(2, '0');
    final g = random.nextInt(256).toRadixString(16).padLeft(2, '0');
    final b = random.nextInt(256).toRadixString(16).padLeft(2, '0');

    // Return hex color string
    return '$r$g$b';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(AppSpacing.md),
          // border: Border.all(color: AppColor.secondaryContainer),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CustomAvatar(name: name, radius: 24),
                if (online)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.sm - 2),
                      decoration: BoxDecoration(
                        color: online ? AppColor.green : AppColor.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColor.white,
                          width: AppSpacing.xxs,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          message,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: isMessageRead ? null : AppColor.secondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: context.textTheme.titleSmall!.copyWith(
                    color: AppColor.secondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                if (isMessageRead)
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.xs),
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$countMessage',
                      style: context.textTheme.titleSmall!.copyWith(
                        color: AppColor.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
