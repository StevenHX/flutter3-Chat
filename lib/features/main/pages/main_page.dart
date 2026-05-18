import 'package:flutter/material.dart';

import '../models/chat_item.dart';
import '../data/chat_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ScrollController _scrollController;
  bool _isLoadingMore = false;
  // Pagination simulation
  int _pageIndex = 1; // 下一页索引，后续可对接真实分页接口
  final int _pageSize = 8;
  bool _hasMore = true;

  static const _menuOptions = ['发起群聊', '添加朋友', '扫一扫', '收付款'];

  late final ChatApi _api;

  List<ChatItem> _chatItems = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 120 &&
          !_isLoadingMore) {
        _loadMore();
      }
    });
    _api = ChatApi();
    _refresh();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    // reset to first page
    _pageIndex = 1;
    _hasMore = true;
    _chatItems.clear();
    final page = await _api.fetchPage(_pageIndex, _pageSize);
    setState(() {
      _chatItems.addAll(page.items);
      _hasMore = _chatItems.length < page.total;
    });
  }

  Future<void> _loadMore() async {
    if (!_hasMore || _isLoadingMore) return;
    setState(() {
      _isLoadingMore = true;
      _pageIndex += 1;
    });
    final page = await _api.fetchPage(_pageIndex, _pageSize);
    setState(() {
      _chatItems.addAll(page.items);
      _isLoadingMore = false;
      _hasMore = _chatItems.length < page.total;
    });
  }

  void _onSelectMenu(String value) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('选择：$value')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter3-Chat'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('搜索功能暂未实现')));
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.add),
            color: Colors.black,
            onSelected: _onSelectMenu,
            itemBuilder: (_) => _menuOptions
                .map(
                  (label) => PopupMenuItem<String>(
                    value: label,
                    child: Text(
                      label,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0F0F0), Color(0xFFF0F0F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.separated(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    itemCount:
                        _chatItems.length +
                        (_isLoadingMore || !_hasMore ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (index < _chatItems.length) {
                        final item = _chatItems[index];
                        return _ChatListTile(item: item);
                      }
                      // footer: loading indicator or "no more" text
                      if (_isLoadingMore) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (!_hasMore) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: Text(
                              '没有更多了',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatListTile extends StatelessWidget {
  final ChatItem item;

  const _ChatListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: const Color(0xFF22B573),
          child: Text(
            item.avatarText,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        title: Text(item.title, style: textTheme.titleMedium),
        subtitle: Text(item.subtitle, style: textTheme.bodyMedium),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(item.time, style: textTheme.bodySmall),
            const SizedBox(height: 8),
            if (item.unreadCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.unreadCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('打开 ${item.title}')));
        },
      ),
    );
  }
}
