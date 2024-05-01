import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/core/presentation/utils/enums/paginated_list_view_type.dart';
import 'package:crypto_app/core/presentation/utils/extensions/paginated_scroll_notification_extension.dart';
import 'package:crypto_app/core/presentation/widgets/paginated_list_view.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/tokens/presentation/notifiers/tokens_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaginatedTokensListView extends ConsumerWidget {
  final Widget? Function(BuildContext, Token) itemBuilder;
  final TokensNotifierProvider tokensNotifierProvider;
  final Widget Function(
    Future<void> Function() onRefresh,
    Widget child,
  )? refreshWidgetBuilder;
  final Widget Function(
    ScrollController controller,
    Widget child,
  )? scrollbarWidgetBuilder;
  final Widget Function(Future<void> Function() onRefresh) emptyListBuilder;
  final Widget? Function(
    Failure failure,
    bool listIsEmpty,
    Future<void> Function() onRefresh,
  )? onError;
  final Widget? loadingWidget;
  final Widget? loadingMoreWidget;
  final EdgeInsets? listPadding;
  final Widget? separator;
  final double? spacing;
  final Axis scrollDirection;
  final PaginatedListViewType paginatedListViewType;
  final Widget Function(VoidCallback onLoadMore)? loadMoreButtonBuilder;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Widget? emptyWidget;

  const PaginatedTokensListView({
    required this.itemBuilder,
    required this.emptyListBuilder,
    required this.tokensNotifierProvider,
    this.refreshWidgetBuilder,
    this.scrollbarWidgetBuilder,
    this.onError,
    this.loadingWidget,
    this.loadingMoreWidget,
    this.listPadding,
    this.separator,
    this.spacing,
    this.scrollDirection = Axis.vertical,
    this.paginatedListViewType = PaginatedListViewType.infiniteScroll,
    this.loadMoreButtonBuilder,
    this.scrollPhysics,
    this.scrollController,
    this.emptyWidget,
    super.key,
  });

  Widget _getRefreshWidget({required Widget child, required WidgetRef ref}) =>
      refreshWidgetBuilder?.call(
        () async => ref.read(tokensNotifierProvider.notifier).refresh(),
        child,
      ) ??
      RefreshIndicator(
        onRefresh: () async =>
            ref.read(tokensNotifierProvider.notifier).refresh(),
        child: child,
      );

  Widget _getScrollbarWidget({
    required ScrollController controller,
    required Widget child,
  }) =>
      scrollbarWidgetBuilder?.call(controller, child) ?? child;

  Widget _getListEmpty(WidgetRef ref) => emptyListBuilder
      .call(() async => ref.read(tokensNotifierProvider.notifier).refresh());

  Widget? _getLoadMoreButton(bool isLastPage, WidgetRef ref) =>
      paginatedListViewType == PaginatedListViewType.loadMoreButton &&
              loadMoreButtonBuilder != null &&
              !isLastPage
          ? loadMoreButtonBuilder!(
              () => ref.read(tokensNotifierProvider.notifier).getNextPage())
          : null;

  bool _onScrollNotification(ScrollNotification scrollInfo, WidgetRef ref) {
    if (paginatedListViewType == PaginatedListViewType.infiniteScroll &&
        scrollInfo.shouldLoadMore) {
      ref.read(tokensNotifierProvider.notifier).getNextPage();
    }
    return scrollInfo.depth == 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginatedState = ref.watch(tokensNotifierProvider);
    final paginatedStateValue = paginatedState.valueOrNull;
    final isLoadingMore = (paginatedStateValue?.page ?? 0) >= 1 &&
        paginatedState is AsyncLoading<PaginatedList<Token>?>;
    final tokens = paginatedStateValue?.data ?? [];
    if (isLoadingMore) {
      return PaginatedListView<Token>(
        itemBuilder: itemBuilder,
        list: tokens,
        isLoading: true,
        loadingWidget: loadingMoreWidget,
        listPadding: listPadding,
        scrollDirection: scrollDirection,
        spacing: spacing,
        separator: separator,
        refreshWidgetBuilder: (Widget child) =>
            _getRefreshWidget(child: child, ref: ref),
        scrollbarWidgetBuilder: (
          ScrollController controller,
          Widget child,
        ) =>
            _getScrollbarWidget(controller: controller, child: child),
        emptyListBuilder: () => _getListEmpty(ref),
        onNotification: (info) => _onScrollNotification(info, ref),
        scrollPhysics: scrollPhysics,
        scrollController: scrollController,
      );
    }
    return paginatedState.when(
      data: (paginatedState) {
        return PaginatedListView<Token>(
          itemBuilder: itemBuilder,
          list: tokens,
          listPadding: listPadding,
          scrollDirection: scrollDirection,
          spacing: spacing,
          separator: separator,
          refreshWidgetBuilder: (Widget child) =>
              _getRefreshWidget(child: child, ref: ref),
          scrollbarWidgetBuilder: (
            ScrollController controller,
            Widget child,
          ) =>
              _getScrollbarWidget(controller: controller, child: child),
          emptyListBuilder: () => _getListEmpty(ref),
          onNotification: (info) => _onScrollNotification(info, ref),
          loadMoreButtonBuilder: () =>
              _getLoadMoreButton(paginatedState.isLast, ref),
          scrollPhysics: scrollPhysics,
          scrollController: scrollController,
        );
      },
      error: (failure, stackTrace) =>
          onError?.call(
              failure is Failure ? failure : Failure(title: failure.toString()),
              paginatedState.valueOrNull?.data.isEmpty ?? true,
              () async =>
                  ref.read(tokensNotifierProvider.notifier).refresh()) ??
          PaginatedListView<Token>(
            itemBuilder: itemBuilder,
            list: tokens,
            listPadding: listPadding,
            scrollDirection: scrollDirection,
            spacing: spacing,
            separator: separator,
            refreshWidgetBuilder: (Widget child) =>
                _getRefreshWidget(child: child, ref: ref),
            scrollbarWidgetBuilder: (
              ScrollController controller,
              Widget child,
            ) =>
                _getScrollbarWidget(controller: controller, child: child),
            emptyListBuilder: () => _getListEmpty(ref),
            onNotification: (info) => _onScrollNotification(info, ref),
            loadMoreButtonBuilder: () => _getLoadMoreButton(false, ref),
            scrollPhysics: scrollPhysics,
            scrollController: scrollController,
          ),
      loading: () =>
          loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          ),
    );
  }
}
