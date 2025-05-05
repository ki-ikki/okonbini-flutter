import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';
import 'package:okonbini_flutter/view/Search/search.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:okonbini_flutter/view/Post/Post.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

    // 非同期処理で updateLoggedInUserProvider を呼び出す
    Future.microtask(() async {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await updateLoggedInUserProvider(currentUser, ref);
      }
    });
  }

  List<Widget> _buildScreens() {
    return [
      const PostPage(), // 投稿一覧画面
      const SearchPage(), // 検索画面
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      // 投稿一覧画面
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white54,
      ),

      // 検索画面
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white54,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style6,
      backgroundColor: const Color(0xFF2699FB),
    );
  }
}
