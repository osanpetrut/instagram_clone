import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/src/epics/authentication_epics.dart';
import 'package:instagram_clone/src/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:meta/meta.dart';
import 'package:instagram_clone/src/data/authentication.api.dart';

class AppEpics {
  const AppEpics({@required AuthApi authApi})
      : assert(authApi != null),
        _authApi = authApi;

  final AuthApi _authApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      AuthEpics(api: _authApi).epics,
    ]);
  }
}
