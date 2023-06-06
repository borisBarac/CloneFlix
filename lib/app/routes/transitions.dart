part of routes;

const _defaultMillis = 400;

Page<dynamic> _embedInSheet(
  BuildContext context, {
  required GoRouterState state,
  required Widget child,
}) {
  final willPopScope = WillPopScope(
    onWillPop: () async {
      final router = GoRouter.of(context);
      final canPop = router.canPop();
      if (canPop) router.pop();
      return canPop;
    },
    child: child,
  );
  return isCupertino(context)
      ? CupertinoSheetPage<void>(key: state.pageKey, child: willPopScope)
      : SheetPage<void>(key: state.pageKey, child: willPopScope);
}

Page<dynamic> _embedInTransparentOverlay(
  BuildContext context, {
  required ValueKey<String> pageKey,
  int? milliseconds,
  bool? hasFractionalBox,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    opaque: false,
    key: pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: milliseconds ?? _defaultMillis),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget embeddedChild,
    ) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

CustomTransitionPage<void> _wrapInSlideOrFade(
  ValueKey<String> pageKey,
  int milliseconds,
  BuildContext context,
  Widget child, {
  bool isLeftRoRight = false,
  bool isFadeIn = false,
}) {
  return CustomTransitionPage<void>(
    key: pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: milliseconds),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return isFadeIn
          ? FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            )
          : SlideTransition(
              position: Tween<Offset>(
                begin: isLeftRoRight ? const Offset(-1, 0) : const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
    },
  );
}
