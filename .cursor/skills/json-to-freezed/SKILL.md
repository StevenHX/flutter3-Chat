---
name: json-to-freezed
description: >-
  从 JSON 字符串或 JSON 文件生成带 freezed/json_serializable 的 Dart 模型骨架，
  并按用户指定路径写入。用于「JSON 转 Freezed」「生成 freezed 模型」「根据接口 JSON 建实体」等场景。
---

# JSON → Freezed 模型生成

## 执行前必须向用户确认（按顺序）

1. **业务名字**：用于 `///` 类文档一句话；并确定 **Dart 类名**（`UpperCamelCase`）与 **文件名**（`lower_snake_case.dart`）。若业务名为中文且无英文类名，让用户给出英文类名或文件基名。
2. **JSON 输入**（三选一或组合）：
   - 粘贴 **JSON 字符串**；
   - 单个 **JSON 文件**路径（读取完整内容解析）；
   - **多个 JSON 文件**路径（逐个读取）。合并规则：**键取并集**；某文件缺失的键在模型里为可空或带 `@Default`；同一键 **类型不一致** 时取更宽表示（如 `Object?` / 并集可空），必要时拆子模型或标为 `Map<String, dynamic>`。
3. **输出路径**：用户要保存的 **完整文件路径**（含 `.dart` 文件名），写入该路径；若目录不存在先创建或提示用户创建。

## 生成后提示用户

在仓库根目录执行：`dart run build_runner build --delete-conflicting-outputs` 生成 `*.freezed.dart` / `*.g.dart`。不要手改生成文件。

## 代码骨架（必须一致）

- 文件首行：`// ignore_for_file: invalid_annotation_target`
- `import 'package:freezed_annotation/freezed_annotation.dart';`
- `part '与当前 dart 文件名同基名的 .freezed.dart';` 与 `part '同基名的 .g.dart';`
- `@freezed`、`abstract class {类名} with _${类名}`、`const {类名}._();`
- `const factory {类名}({ ... }) = _{类名};`
- `factory {类名}.fromJson(Map<String, dynamic> json) => _$...FromJson(json);`
- 非 lowerCamelCase 的 JSON 键使用 `@JsonKey(name: '...')`；列表空值常用 `@Default(<T>[]) List<T> ...`；需要时用 `@JsonKey(fromJson: _xxxFromJson)` 与文件内私有顶层转换函数。

## 结构样例（verbatim；生成时替换类名/文件名/字段与业务 getter）

```dart
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';
part 'news_article.g.dart';

@freezed
/// 新闻实体模型：负责承载接口字段并提供 UI 友好的派生属性。
abstract class NewsArticle with _$NewsArticle {
  const NewsArticle._();

  const factory NewsArticle({
    @JsonKey(name: 'article_id') @Default('') String articleId,
    @Default('Untitled') String title,
    String? description,
    String? content,
    String? link,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'source_name') @Default('Unknown Source') String sourceName,
    @Default(<String>[]) List<String> creator,
    @JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) DateTime? pubDate,
    @Default(<String>[]) List<String> category,
    @Default(<String>[]) List<String> country,
  }) = _NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);

  /// 作者展示文本：没有作者时给出兜底文案，避免页面出现空白。
  String get authorText {
    if (creator.isEmpty) {
      return '未知作者';
    }
    return creator.join('、');
  }

  /// 摘要展示文本：优先 description，空值时返回默认提示。
  String get summaryText {
    final summary = description?.trim();
    if (summary == null || summary.isEmpty) {
      return '暂无摘要';
    }
    return summary;
  }

  /// 正文展示文本：过滤掉接口收费占位文本，回退到摘要内容。
  String get bodyText {
    final text = content?.trim();
    if (text != null &&
        text.isNotEmpty &&
        text != 'ONLY AVAILABLE IN PAID PLANS') {
      return text;
    }
    return summaryText;
  }

  /// 是否可跳转原文：要求 URL 可被解析且包含协议头。
  bool get hasOriginalLink {
    final value = link;
    if (value == null) {
      return false;
    }
    final uri = Uri.tryParse(value);
    return uri != null && uri.hasScheme;
  }
}

DateTime? _dateTimeFromJson(Object? value) {
  // 接口时间字段可能为空串或非字符串，统一转成 null。
  if (value is! String || value.trim().isEmpty) {
    return null;
  }

  // 某些返回是 "yyyy-MM-dd HH:mm:ss"，先补成 ISO 风格再解析。
  final normalized = value.trim().replaceFirst(' ', 'T');
  return DateTime.tryParse('${normalized}Z') ?? DateTime.tryParse(value);
}
```

**说明**：样例中的 `NewsArticle`、`news_article`、`///` 文案、字段名与自定义 getter 仅作版式参考；实际输出中全部替换为当前业务的类名、文件名、JSON 映射与（用户要求的）派生属性；无派生需求时可只保留 `factory` 与 `fromJson`，不写多余 getter。
