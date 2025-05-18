import 'package:chat_flutter/features/chat/view/chat_page.dart';
import 'package:chat_flutter/features/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/navigation_cubit.dart';
import '../widget/bottom_app_bar_custom.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  static const routePath = '/navigation';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final listWidget = const [ChatPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (NavigationCubit cubit) => cubit.state.indexTab,
    );
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: listWidget),
      bottomNavigationBar: BottomAppBarCustom(
        selectedIndex: selectedIndex,
        onTap: (index) {
          context.read<NavigationCubit>().changeIndex(index);
        },
      ),
    );
  }
}
