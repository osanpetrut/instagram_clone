import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/src/containers/auth/index.dart';
import 'package:instagram_clone/src/models/authentication/index.dart';
import 'package:instagram_clone/src/presentation/home/home_page.dart';
import 'package:instagram_clone/src/presentation/login/login_page.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser user) {
        if (user == null) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
