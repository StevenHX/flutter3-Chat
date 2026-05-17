import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/widgets/soft_input_field.dart';
import '../providers/news_list_provider.dart';
import '../widgets/news_card.dart';
import '../widgets/news_category_bar.dart';
import '../widgets/news_state_view.dart';

/// 新闻列表页：展示分类、列表数据，并处理加载/错误/空态。
@Dependencies([NewsList, selectedNewsCategory])
class NewsListPage extends ConsumerStatefulWidget {
  const NewsListPage({super.key});

  @override
  ConsumerState<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends ConsumerState<NewsListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 数据流：UI watch -> newsListProvider -> NewsList(Notifier) -> NewsApi。
    final newsState = ref.watch(newsListProvider);
    // 分类高亮状态单独由 Provider 暴露，避免 UI 直接读取 Notifier 字段。
    final selectedCategory = ref.watch(selectedNewsCategoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('News Course'), centerTitle: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SoftInputField(
              controller: _searchController,
              hintText: '搜索新闻标题或关键词',
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) => setState(() {
                _searchQuery = value.trim();
              }),
            ),
          ),
          // 分类选择条，切换分类会触发 Provider 内部刷新数据。
          NewsCategoryBar(
            categories: newsCategories,
            selectedCategory: selectedCategory,
            onSelected: (category) {
              // 触发分类切换后，Provider 内部会刷新数据。
              ref.read(newsListProvider.notifier).selectCategory(category);
            },
          ),
          const Divider(height: 1),
          Expanded(
            child: newsState.when(
              loading: () => const NewsLoadingView(),
              error: (error, _) => NewsErrorView(
                message: error.toString(),
                // 直接 invalidate 触发重试，简化交互逻辑。
                onRetry: () => ref.invalidate(newsListProvider),
              ),
              data: (articles) {
                final filteredArticles = _searchQuery.isEmpty
                    ? articles
                    : articles.where((article) {
                        final query = _searchQuery.toLowerCase();
                        return article.title.toLowerCase().contains(query) ||
                            article.summaryText.toLowerCase().contains(query);
                      }).toList();

                // 列表数据为空时展示空态视图，提示用户当前没有内容。
                if (filteredArticles.isEmpty) {
                  // 空列表时仍保留下拉刷新能力，方便用户主动重试。
                  return RefreshIndicator(
                    onRefresh: () =>
                        ref.read(newsListProvider.notifier).refresh(),
                    child: const CustomScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      slivers: [SliverFillRemaining(child: NewsEmptyView())],
                    ),
                  );
                }

                // 列表数据正常时展示文章列表，支持下拉刷新。
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(newsListProvider.notifier).refresh(),
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: filteredArticles.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final article = filteredArticles[index];
                      return NewsCard(
                        article: article,
                        // 使用集中管理的路径生成函数，避免页面里手动拼接路由字符串。
                        onTap: () => context.push(
                          AppRoutes.newsDetailPath(article.articleId),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
