import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  static const String routePath = '/about';

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final String appVersion = '2.5.0';
  final String buildNumber = '2025.301.42';
  final String releaseDate = 'March 22, 2025';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildAppInfoCard(),
                _buildFeatureList(),
                _buildTeamSection(),
                _buildVersionDetails(),
                _buildSocialLinks(),
                const SizedBox(height: AppSpacing.xxl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo[800]!,
                Colors.blue[700]!,
                Colors.blue[400]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Animated background shapes
              Positioned(
                top: -50,
                right: -50,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                left: -30,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              // App logo and title
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 60,
                        height: 60,
                        errorBuilder:
                            (context, error, stackTrace) => Icon(
                              IconlyBold.chat,
                              size: 40,
                              color: AppColor.primary,
                            ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      'SocialChat',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppInfoCard() {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'The Future of Social Connection',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'SocialChat brings people together through secure, intuitive, and intelligent communication tools powered by advanced AI.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('65M+', 'Active Users'),
              _buildVerticalDivider(),
              _buildStatItem('190+', 'Countries'),
              _buildVerticalDivider(),
              _buildStatItem('4.8', 'App Rating'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 40, width: 1, color: Colors.grey[300]);
  }

  Widget _buildFeatureList() {
    final features = [
      {
        'icon': IconlyBold.shield_done,
        'color': Colors.blue,
        'title': 'End-to-End Encryption',
        'description': 'Your messages are securely encrypted',
      },
      {
        'icon': IconlyBold.video,
        'color': Colors.purple,
        'title': '8K Video Calls',
        'description': 'Crystal clear video conversations',
      },
      {
        'icon': IconlyBold.chart,
        'color': Colors.green,
        'title': 'AI-Powered Assistance',
        'description': 'Smart suggestions and organization',
      },
      {
        'icon': IconlyBold.activity,
        'color': Colors.orange,
        'title': 'Cross-Platform Sync',
        'description': 'Seamless experience across devices',
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.md,
            ),
            child: Text(
              'Key Features',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.md),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: features.length,
              separatorBuilder:
                  (context, index) =>
                      Divider(color: Colors.grey[200], height: 1),
              itemBuilder: (context, index) {
                final feature = features[index];
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: (feature['color'] as Color).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      feature['icon'] as IconData,
                      color: feature['color'] as Color,
                    ),
                  ),
                  title: Text(
                    feature['title'] as String,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    feature['description'] as String,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.md,
            ),
            child: Text(
              'Our Team',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.md),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTeamMember(
                      'Chorn THOEN',
                      'Founder & CEO',
                      'https://ui-avatars.com/api/?name=Chorn+THOEN&background=0D8ABC&color=fff',
                    ),
                    const SizedBox(width: AppSpacing.xlg),
                    _buildTeamMember(
                      'Sarah Lin',
                      'Head of Design',
                      'https://ui-avatars.com/api/?name=Sarah+Lin&background=43A047&color=fff',
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTeamMember(
                      'Alex Moreno',
                      'Lead Developer',
                      'https://ui-avatars.com/api/?name=Alex+Moreno&background=E53935&color=fff',
                    ),
                    const SizedBox(width: AppSpacing.xlg),
                    _buildTeamMember(
                      'Kim Lee',
                      'UX Specialist',
                      'https://ui-avatars.com/api/?name=Kim+Lee&background=7B1FA2&color=fff',
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                TextButton(
                  onPressed: () {
                    // Navigate to full team page
                  },
                  child: Text(
                    'View Full Team',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, String imageUrl) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.primary.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          name,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          role,
          style: context.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildVersionDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Version Info',
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                ),
                child: Text(
                  'Latest',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _buildVersionRow('App Version', appVersion),
          _buildVersionRow('Build Number', buildNumber),
          _buildVersionRow('Release Date', releaseDate),
          _buildVersionRow('Platform', 'Android & iOS'),
          const SizedBox(height: AppSpacing.sm),
          Divider(color: Colors.grey[200]),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Terms of Service',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColor.primary,
                ),
              ),
              const Icon(IconlyLight.arrow_right_2, size: 16),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Privacy Policy',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColor.primary,
                ),
              ),
              const Icon(IconlyLight.arrow_right_2, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVersionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          Text(
            'Connect With Us',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(Icons.language, Colors.blue, () {
                _launchUrl('https://example.com');
              }),
              _buildSocialButton(Icons.facebook, Colors.indigo, () {
                _launchUrl('https://facebook.com');
              }),
              _buildSocialButton(Icons.chat_bubble, Colors.green, () {
                _launchUrl('https://twitter.com');
              }),
              _buildSocialButton(Icons.camera_alt, Colors.purple, () {
                _launchUrl('https://instagram.com');
              }),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '© 2025 SocialChat. All rights reserved.',
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
