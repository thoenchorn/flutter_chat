import 'package:chat_flutter/shared/color/app_color.dart';
import 'package:chat_flutter/shared/extensions/close_keyboard.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:chat_flutter/shared/widgets/filled_button_custom.dart';
import 'package:chat_flutter/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  static const String routePath = '/personal-info';

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _bioController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "Chorn THOEN");
    _usernameController = TextEditingController(text: "chornthoen");
    _emailController = TextEditingController(text: "chornthoen@gmail.com");
    _phoneController = TextEditingController(text: "+855 12 345 678");
    _bioController = TextEditingController(
      text:
          "Flutter developer passionate about creating beautiful user experiences.",
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.closeKeyboard(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            'Personal Information',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (_isEditing) {
                    // Save changes
                    if (_formKey.currentState!.validate()) {
                      _isEditing = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated!')),
                      );
                    }
                  } else {
                    _isEditing = true;
                  }
                });
              },
              child: Text(
                _isEditing ? 'Save' : 'Edit',
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.grey[100],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ProfileHeader(isEditing: _isEditing),
              _buildForm(),
              AppSpacing.verticalXLG,
            ],
          ),
        ),
        bottomNavigationBar:
            !_isEditing
                ? null
                : Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppSpacing.xlg,
                    right: AppSpacing.md,
                    left: AppSpacing.md,
                  ),
                  child: FilledButtonCustom(text: 'Save', onPressed: () {}),
                ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            AppSpacing.verticalLG,
            TextFieldCustom(
              controller: _nameController,
              prefixIcon: IconlyLight.profile,
              label: 'Full Name',
              enabled: _isEditing,
            ),
            AppSpacing.verticalLG,
            TextFieldCustom(
              controller: _usernameController,
              prefixIcon: IconlyLight.user,
              label: 'Username',
              enabled: _isEditing,
            ),
            AppSpacing.verticalLG,
            Text(
              'Contact Information',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            AppSpacing.verticalLG,
            TextFieldCustom(
              controller: _emailController,
              label: 'Email Address',
              prefixIcon: IconlyLight.message,
              keyboardType: TextInputType.emailAddress,
              enabled: _isEditing,
            ),
            AppSpacing.verticalLG,
            TextFieldCustom(
              controller: _phoneController,
              label: 'Phone Number',
              prefixIcon: IconlyLight.call,
              keyboardType: TextInputType.phone,
              enabled: _isEditing,
            ),
            AppSpacing.verticalLG,
            Text(
              'About You',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            AppSpacing.verticalLG,
            TextFieldCustom(
              controller: _bioController,
              label: 'Bio',
              maxLines: 3,
              prefixIcon: IconlyLight.info_square,
              enabled: _isEditing,
            ),
            AppSpacing.verticalMD,
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required bool isEditing})
    : _isEditing = isEditing;

  final bool _isEditing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.lg),
      child: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Hero(
              tag: 'profile_image',
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://ui-avatars.com/api/?name=Chorn+THOEN&background=random&color=fff&size=256",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (_isEditing)
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  IconlyBold.camera,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
