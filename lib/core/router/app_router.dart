import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/contacts/pages/contacts_page.dart';
import '../../features/main/pages/main_page.dart';
import '../../features/mine/pages/mine_page.dart';
import '../../features/news/pages/news_detail_page.dart';
import '../../features/news/pages/news_list_page.dart';
import '../../features/news/providers/news_detail_provider.dart';
import '../../features/news/providers/news_list_provider.dart';
import 'app_routes.dart';

import '../../features/login/screens/login_screen.dart';

// 这一行必须写，build_runner 会根据它生成 app_router.g.dart。
part 'app_router.g.dart';

/// 应用级路由 Provider。
///
/// keepAlive 表示这个路由对象在应用运行期间保持稳定。
@Riverpod(
  keepAlive: true,
  dependencies: [NewsList, selectedNewsCategory, newsDetail],
)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    // 应用启动后默认进入聊天首页。
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (_, _) => const MainPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.contacts,
                builder: (_, _) => const ContactsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.mine,
                builder: (_, _) => const MinePage(),
              ),
            ],
          ),
        ],
      ),
      // /news -> 新闻列表页
      GoRoute(path: AppRoutes.news, builder: (_, _) => const NewsListPage()),
      // /news/:id -> 新闻详情页
      GoRoute(
        path: AppRoutes.newsDetail,
        builder: (_, state) {
          // 从路径参数中读取 id，例如 /news/article_001 中的 article_001。
          final id = state.pathParameters['id']!;
          return NewsDetailPage(newsId: id);
        },
      ),
    ],
  );
}

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '聊天',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            label: '联系人',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), 
            label: '我'
          ),
        ],
      ),
    );
  }
}
