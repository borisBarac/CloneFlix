import 'package:flutter/material.dart';

/// Here we put all the objects that can force us to reload the whole app
/// Examples would be error listener, logins state, payments, kids mode, ...
/// More complex example can be found at bottom of this file
class RouterState extends ChangeNotifier {
  DateTime _loaded = DateTime.now();

  DateTime get loaded => _loaded;
  void reload() {
    _loaded = DateTime.now();
    notifyListeners();
  }
}

/*
More complex example:

```dart
GoRouter(routes: [], 
        refreshListenable: AuthenticationBloc());


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AppStarted>(_onAppStarted);

    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);

    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _userSubscription = _authenticationRepository.user
        .listen((user) => add(AuthenticationUserChanged(user)));
  }

  final AuthenticationRepository _authenticationRepository;

  late StreamSubscription<User> _userSubscription;


  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.unknown());
  }

  FutureOr<void> _onAuthenticationUserChanged(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    final status = event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
    emit(status);
    notifyListeners();
  }

  FutureOr<void> _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.logOut());
  }
}
```
*/