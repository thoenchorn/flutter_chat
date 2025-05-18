import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FAndQPage extends StatefulWidget {
  const FAndQPage({super.key});

  static const String routePath = '/f-and-q';

  @override
  State<FAndQPage> createState() => _FAndQPageState();
}

class _FAndQPageState extends State<FAndQPage> {
  // Track expanded FAQ items
  final List<bool> _expandedList = List.generate(10, (index) => false);

  // Search query
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Categories
  final List<String> _categories = [
    'All',
    'Account',
    'Features',
    'Privacy',
    'Billing',
    'Technical',
  ];

  String _selectedCategory = 'All';

  // FAQ data
  final List<Map<String, dynamic>> _faqItems = [
    {
      'category': 'Account',
      'question': 'How do I change my display name and profile picture?',
      'answer':
          'You can update your profile information by navigating to the Profile tab, then tapping on the edit icon next to your name or profile picture. From there, you can upload a new photo or enter a new display name.',
    },
    {
      'category': 'Account',
      'question': 'Can I use the same account on multiple devices?',
      'answer':
          'Yes, you can log in to your account on up to 5 devices simultaneously. Each new login beyond this limit will automatically log out the oldest device session.',
    },
    {
      'category': 'Features',
      'question': 'How do I create a group chat?',
      'answer':
          'To create a group chat, go to the Chats tab and tap the "+" button in the top right corner. Select "New Group" and choose the contacts you want to add. Then, set a group name and optional image before creating it.',
    },
    {
      'category': 'Features',
      'question': 'What file types can I send in a chat?',
      'answer':
          'Our app supports sending images, videos, audio files, documents (PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX), and other common file types up to 100 MB in size.',
    },
    {
      'category': 'Privacy',
      'question': 'Is my chat history backed up?',
      'answer':
          'Chat history is backed up to your cloud account by default. You can disable this feature in Privacy Settings if you prefer. Note that turning off backups means your chat history will be lost if you uninstall the app or switch devices.',
    },
    {
      'category': 'Privacy',
      'question': 'Can I delete messages after sending them?',
      'answer':
          'Yes, you can delete messages for everyone in the chat within 48 hours of sending. After that, you can only delete them from your own view, but other participants will still see them.',
    },
    {
      'category': 'Billing',
      'question': 'What payment methods do you accept?',
      'answer':
          'We accept all major credit cards (Visa, MasterCard, American Express), PayPal, Apple Pay, Google Pay, and in some regions, mobile carrier billing.',
    },
    {
      'category': 'Billing',
      'question': 'How do I cancel my premium subscription?',
      'answer':
          'You can cancel your subscription anytime by going to Settings > Account > Subscription > Cancel Subscription. Your premium features will remain active until the end of your current billing period.',
    },
    {
      'category': 'Technical',
      'question': 'Why am I having connection issues?',
      'answer':
          'Connection issues may be caused by weak internet signal, server maintenance, or app-specific problems. Try checking your internet connection, restarting the app, or updating to the latest version. If problems persist, contact our support team.',
    },
    {
      'category': 'Technical',
      'question': 'How much storage space does the app use?',
      'answer':
          'The app itself uses approximately 250 MB of storage. Additional space is used for cached media and messages, which you can clear in Settings > Storage > Clear Cache without losing your data.',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter FAQs based on search query and selected category
    final filteredFAQs =
        _faqItems.where((faq) {
          final matchesCategory =
              _selectedCategory == 'All' ||
              faq['category'] == _selectedCategory;
          final matchesSearch =
              _searchQuery.isEmpty ||
              faq['question'].toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
              faq['answer'].toLowerCase().contains(_searchQuery.toLowerCase());
          return matchesCategory && matchesSearch;
        }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [_buildSearchBar(), _buildCategorySelector()],
                  ),
                ),
              ];
            },
            body: _buildFaqList(filteredFAQs),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      elevation: 0,
      floating: true,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            'FAQ',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Find answers to common questions',
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(IconlyLight.arrow_left_2, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.chat, color: Colors.black),
          onPressed: () {
            // Open support chat
          },
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search for questions',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: const Icon(IconlyLight.search, color: AppColor.primary),
          suffixIcon:
              _searchQuery.isNotEmpty
                  ? IconButton(
                    icon: const Icon(
                      IconlyLight.close_square,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _searchQuery = '';
                      });
                    },
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: AppSpacing.sm),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primary : Colors.white,
                borderRadius: BorderRadius.circular(AppSpacing.md),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: AppColor.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                ],
              ),
              child: Center(
                child: Text(
                  category,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.white : Colors.grey[800],
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFaqList(List<Map<String, dynamic>> filteredFAQs) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: filteredFAQs.length,
      itemBuilder: (context, index) {
        final faq = filteredFAQs[index];
        final isExpanded = _expandedList.length > index && _expandedList[index];

        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.md),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.all(AppSpacing.md),
              childrenPadding: const EdgeInsets.only(
                left: AppSpacing.md,
                right: AppSpacing.md,
                bottom: AppSpacing.md,
              ),
              initiallyExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                if (index < _expandedList.length) {
                  setState(() {
                    _expandedList[index] = expanded;
                  });
                }
              },
              leading: Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: _getCategoryColor(faq['category']).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getCategoryIcon(faq['category']),
                  color: _getCategoryColor(faq['category']),
                  size: 18,
                ),
              ),
              title: Text(
                faq['question'],
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  faq['category'],
                  style: context.textTheme.bodySmall?.copyWith(
                    color: _getCategoryColor(faq['category']),
                  ),
                ),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color:
                      isExpanded
                          ? AppColor.primary.withOpacity(0.1)
                          : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    isExpanded
                        ? IconlyBold.arrow_up_2
                        : IconlyBold.arrow_down_2,
                    size: 16,
                    color: isExpanded ? AppColor.primary : Colors.grey,
                  ),
                ),
              ),
              children: [
                Divider(color: Colors.grey[200]),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  faq['answer'],
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[800],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Handle copying answer to clipboard
                      },
                      icon: const Icon(
                        IconlyLight.document,
                        size: 16,
                        color: AppColor.primary,
                      ),
                      label: Text(
                        'Copy',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Handle helpful feedback
                      },
                      icon: const Icon(
                        IconlyLight.heart,
                        size: 16,
                        color: AppColor.primary,
                      ),
                      label: Text(
                        'Helpful',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Account':
        return Colors.indigo;
      case 'Features':
        return Colors.teal;
      case 'Privacy':
        return Colors.deepPurple;
      case 'Billing':
        return Colors.orange;
      case 'Technical':
        return Colors.blue;
      default:
        return AppColor.primary;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Account':
        return IconlyBold.profile;
      case 'Features':
        return IconlyBold.star;
      case 'Privacy':
        return IconlyBold.shield_done;
      case 'Billing':
        return IconlyBold.wallet;
      case 'Technical':
        return IconlyBold.setting;
      default:
        return IconlyBold.info_square;
    }
  }
}
