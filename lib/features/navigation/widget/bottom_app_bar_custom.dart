import 'dart:io';

import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomAppBarCustom extends StatelessWidget {
  const BottomAppBarCustom({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final int selectedIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColor.outline.withOpacity(.3), width: 1),
        ),
      ),
      child: BottomAppBar(
        height: Platform.isIOS ? 65 : 75,
        color: Colors.transparent,
        elevation: 2,
        notchMargin: 2,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: Platform.isIOS ? 4 : AppSpacing.sm,
        ),
        surfaceTintColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            itemNavigation(
              label: 'Chat',
              index: 0,
              icon: IconlyBold.chat,
              iconSelected: IconlyBold.chat,
              onTap: () => onTap(0),
            ),
            itemNavigation(
              label: 'Profile',
              index: 1,
              icon: IconlyBold.profile,
              iconSelected: IconlyBold.profile,
              onTap: () => onTap(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemNavigation({
    required String label,
    required int index,
    required IconData icon,
    required IconData iconSelected,
    required VoidCallback onTap,
  }) {
    final isSelected = index == selectedIndex;
    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.md),
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 70, minHeight: 65),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.md),
            color: isSelected ? AppColor.primary.withOpacity(.3) : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected ? iconSelected : icon,
                color: isSelected ? AppColor.primary : AppColor.secondary,
                size: isSelected ? 24 : 32,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder:
                    (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        sizeFactor: animation,
                        axis: Axis.horizontal,
                        child: child,
                      ),
                    ),
                child:
                    isSelected
                        ? Text(
                          label,
                          key: ValueKey(label),
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: AppSpacing.md,
                          ),
                        )
                        : const SizedBox.shrink(key: ValueKey('empty')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
