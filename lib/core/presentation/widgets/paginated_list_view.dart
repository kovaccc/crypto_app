import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PaginatedListView<Entity> extends HookWidget {
  final Widget? Function(BuildContext, Entity) itemBuilder;
  final Widget Function(Widget child) refreshWidgetBuilder;
  final Widget Function(
    ScrollController controller,
    Widget child,
  ) scrollbarWidgetBuilder;
  final Widget Function() emptyListBuilder;
  final Widget? Function()? loadMoreButtonBuilder;
  final List<Entity> list;
  final bool Function(ScrollNotification) onNotification;
  final Widget? loadingWidget;
  final bool isLoading;
  final EdgeInsets? listPadding;
  final Widget? separator;
  final double? spacing;
  final Axis scrollDirection;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  const PaginatedListView({
    super.key,
    required this.itemBuilder,
    required this.list,
    required this.refreshWidgetBuilder,
    required this.scrollbarWidgetBuilder,
    required this.emptyListBuilder,
    this.loadMoreButtonBuilder,
    required this.onNotification,
    this.loadingWidget,
    this.isLoading = false,
    this.listPadding,
    this.separator,
    this.spacing,
    required this.scrollDirection,
    this.scrollPhysics,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = scrollController ?? useScrollController();
    return list.isNotEmpty
        ? NotificationListener(
            onNotification: onNotification,
            child: refreshWidgetBuilder(
              scrollbarWidgetBuilder(
                controller,
                ListView.separated(
                  controller: controller,
                  physics: scrollPhysics,
                  padding: listPadding,
                  scrollDirection: scrollDirection,
                  itemBuilder: (context, index) {
                    if (index == list.length + 1) {
                      return isLoading
                          ? loadingWidget ??
                              const Center(child: CircularProgressIndicator())
                          : const SizedBox();
                    }
                    if (index == list.length) {
                      return loadMoreButtonBuilder?.call() ?? const SizedBox();
                    }
                    return itemBuilder(context, list[index]);
                  },
                  itemCount: list.length + 2,
                  separatorBuilder: (_, index) => index < list.length - 1
                      ? separator ?? SizedBox(height: spacing ?? 10)
                      : const SizedBox(),
                ),
              ),
            ),
          )
        : emptyListBuilder();
  }
}
