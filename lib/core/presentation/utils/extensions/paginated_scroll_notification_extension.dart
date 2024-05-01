import 'package:flutter/material.dart';

extension PaginatedScrollNotificationExtension on ScrollNotification {
  static const _loadMoreScrollOffset = 50;

  bool get shouldLoadMore =>
      metrics.pixels >= metrics.maxScrollExtent - _loadMoreScrollOffset;
}
