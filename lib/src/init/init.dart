import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/src/data/authentication.api.dart';
import 'package:instagram_clone/src/epics/app_epics.dart';
import 'package:instagram_clone/src/epics/authentication_epics.dart';
import 'package:instagram_clone/src/models/index.dart';
import 'package:instagram_clone/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:firebase_core/firebase_core.dart';

Future<Store<AppState>> init() async {
  await Firebase.initializeApp();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthApi authApi = AuthApi(auth: auth, firestore: firestore);
  final AppEpics epic = AppEpics(authApi: null);
  return Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.epics),
    ],
  );
}
