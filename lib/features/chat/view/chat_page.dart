import 'package:chat_flutter/features/chat/model/chat_model.dart';
import 'package:chat_flutter/features/chat/view/chat_detail_page.dart';
import 'package:chat_flutter/features/chat/widgets/item_chat.dart';
import 'package:chat_flutter/features/navigation/blocs/navigation_cubit.dart';
import 'package:chat_flutter/shared/spacing/app_spacing.dart';
import 'package:chat_flutter/shared/theme/app_theme.dart';
import 'package:chat_flutter/shared/widgets/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../shared/color/app_color.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static const String routePath = '/chat';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
  }

  void _listenToScrollChange() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenToScrollChange);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 80,
        title: GestureDetector(
          onTap: () {
            context.read<NavigationCubit>().changeIndex(1);
          },
          child: Row(
            children: [
              CustomAvatar(name: 'Chorn THOEN', radius: 28),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello!',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Chorn THOEN',
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColor.secondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.search, size: AppSpacing.xlg),
          ),
          AppSpacing.horizontalSM,
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: getSampleChats().length,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemBuilder: (context, index) {
                final chat = getSampleChats()[index];
                return ItemChat(
                  onTap: () {
                    context.push(ChatDetailPage.routePath, extra: chat);
                  },
                  id: chat.id,
                  avatarUrl: chat.avatarUrl,
                  name: chat.name,
                  message: chat.message,
                  time: chat.time,
                  isMessageRead: chat.isMessageRead,
                  online: chat.online,
                  countMessage: chat.countMessage,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _isVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isVisible ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
