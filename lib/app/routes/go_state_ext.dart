import 'package:clone_flix/extensions/type_extensions.dart';
import 'package:go_router/go_router.dart';

extension GoQueryParamsState on GoRouterState {
  bool get queryIsMobile {
    final qp = queryParams['isMobile'];

    return qp?.parseBool() ?? true;
  }
}
