import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryadapplication/features/coach_sportif/presentation/pages/login_page.dart';
import 'package:ryadapplication/features/coach_sportif/presentation/common/theme.dart';
import 'HomeActivity.dart';
import 'features/coach_sportif/data/models/AuthService.dart';

void main() => runApp(
      ChangeNotifierProvider<AuthService>(
        child: MyApp(),
        builder: (BuildContext context) {
          return AuthService();
        },
      ),
    );

class MyApp extends StatelessWidget {
  static const String _title = 'Coach Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: appTheme,
      home: FutureBuilder(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.hasData ? NavbarBottom() : LoginPage();
          } else {
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }
}
