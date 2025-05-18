import 'package:chat_flutter/features/profile/view/about_page.dart';
import 'package:chat_flutter/features/profile/view/chat_setting_page.dart';
import 'package:chat_flutter/features/profile/view/content_preferences_page.dart';
import 'package:chat_flutter/features/profile/view/personal_info_page.dart';
import 'package:chat_flutter/features/profile/view/privacy_and_security_page.dart';
import 'package:chat_flutter/features/profile/widgets/menu_item.dart';
import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String routePath = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotificationsOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.md),
                child: IconButton(
                  onPressed: () {
                    // Navigate to edit profile page
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(AppSpacing.xs),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      IconlyLight.edit,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.primary,
                      AppColor.primary.withOpacity(0.5),
                      AppColor.primary.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: AppSpacing.lg),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: Hero(
                          tag: '',
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "https://ui-avatars.com/api/?name=Chorn+HOEN&background=random&color=fff&size=256",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'Chorn THOEN',
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        '@chornthoen',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Profile Content
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.verticalLG,
                  Text(
                    'General Account',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.verticalLG,
                  MenuItem(
                    title: 'Personal Information',
                    subtitle: 'Update your personal details',
                    icon: IconlyLight.profile,
                    onTap: () {
                      context.push(PersonalInfoPage.routePath);
                    },
                  ),
                  MenuItem(
                    title: 'Notifications',
                    subtitle: 'Manage your notification preferences',
                    icon: IconlyLight.notification,
                    trailing: _buildThemeSwitch(),
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'Privacy & Security',
                    subtitle: 'Control your privacy settings',
                    icon: IconlyLight.shield_done,
                    onTap: () {
                      context.push(PrivacyAndSecurityPage.routePath);
                    },
                  ),
                  AppSpacing.verticalLG,
                  Text(
                    'App Settings',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.verticalMD,
                  MenuItem(
                    title: 'Chat Settings',
                    subtitle: 'Configure chat features and appearance',
                    icon: IconlyLight.chat,
                    onTap: () {
                      context.push(ChatSettingPage.routePath);
                    },
                  ),
                  MenuItem(
                    title: 'Content Preferences',
                    subtitle: 'Customize your content experience',
                    icon: IconlyLight.document,
                    onTap: () {
                      context.push(ContentPreferencesPage.routePath);
                    },
                  ),
                  AppSpacing.verticalLG,
                  Text(
                    'Support',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.verticalMD,
                  MenuItem(
                    title: 'About',
                    subtitle: 'App version and information',
                    icon: IconlyLight.info_square,
                    onTap: () {
                      context.push(AboutPage.routePath);
                    },
                  ),
                  MenuItem(
                    title: 'Sign Out',
                    subtitle: 'Log out from your account',
                    icon: IconlyLight.logout,
                    textColor: Colors.redAccent,
                    onTap: () {
                      _showSignOutDialog();
                    },
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Sign Out",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
            padding: const EdgeInsets.all(AppSpacing.md),
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.md),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      IconlyBold.logout,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    "Sign Out",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    "Are you sure you want to sign out from your account? You'll need to sign in again to access your messages and data.",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
    );
  }

  Widget _buildThemeSwitch() {
    return Switch.adaptive(
      value: isNotificationsOpen,
      onChanged: (value) {
        setState(() {
          isNotificationsOpen = value;
        });
      },
      activeColor: AppColor.primary,
    );
  }
}
