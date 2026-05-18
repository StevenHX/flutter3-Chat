import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  static const _quickActions = [
    _ContactsAction(icon: Icons.person_add, label: '新的朋友'),
    _ContactsAction(icon: Icons.location_on, label: '附近的朋友'),
    _ContactsAction(icon: Icons.group, label: '群聊'),
    _ContactsAction(icon: Icons.payment, label: '收付款'),
  ];

  static const _contacts = [
    'A00思源网络-张18620165875',
    'AAAA爱宝',
    '白色风车',
    '八千里云和路',
    '傍晚时分',
    '晨曦静好',
    '沐风听雨',
    '秋水伊人',
    '若水流年',
    '随风而行',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('联系人'), elevation: 0),
      body: Column(
        children: [
          Container(
            color: theme.scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _quickActions
                  .map(
                    (action) => Expanded(
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${action.label} 暂未实现')),
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                action.icon,
                                size: 28,
                                color: theme.primaryColor,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                action.label,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _contacts.length,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) {
                final name = _contacts[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.primaryColor.withValues(alpha: 0.16),
                    child: Text(
                      name[0],
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(name, style: theme.textTheme.bodyLarge),
                  subtitle: const Text('联系人'),
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('打开 $name 详情')));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactsAction {
  final IconData icon;
  final String label;

  const _ContactsAction({required this.icon, required this.label});
}
