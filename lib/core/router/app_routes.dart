/// 集中管理路由路径，避免页面里到处手写字符串。
class AppRoutes {
  const AppRoutes._();

  /// 应用启动页。
  static const home = '/';
  // 个人中心页。
  static const mine = '/mine';
  // 登录页。
  static const login = '/login';

  /// 联系人页。
  static const contacts = '/contacts';

  /// 新闻列表页真实路径。
  static const news = '/news';

  /// 新闻详情页路由模板，`:id` 是路径参数占位符。
  static const newsDetail = '/news/:id';

  /// 根据新闻 id 生成真正用于跳转的路径。
  static String newsDetailPath(String id) => '/news/$id';
}
