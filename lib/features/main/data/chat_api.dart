import 'dart:async';

import '../models/chat_item.dart';

/// Simple paged response.
class ChatPage {
  final List<ChatItem> items;
  final int total;

  ChatPage(this.items, this.total);
}

/// Fake API that simulates network delay and returns paged chat items.
class ChatApi {

  ChatApi();

  Future<ChatPage> fetchPage(int pageIndex, int pageSize) async {
    // simulate network delay
    await Future.delayed(const Duration(milliseconds: 700));

    final start = (pageIndex - 1) * pageSize;
    final take = pageSize;

    final List<ChatItem> items = List.generate(take, (i) {
      final idx = start + i + 1;
      return ChatItem(
        title: '第$pageIndex页 - 群组 #$idx',
        subtitle: '这是第$pageIndex页加载的示例消息',
        time: '刚刚',
        unreadCount: (idx % 5 == 0) ? 23 : 0,
        avatarText: 'G',
      );
    });

    return ChatPage(items, 30);
  }
}
