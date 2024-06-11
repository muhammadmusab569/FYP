import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp/firebase_options.dart';
import 'package:fyp/pages/bottom_nav.dart';
import 'package:fyp/pages/onboard.dart';
import 'package:fyp/services/shared_preference.dart';
import 'package:fyp/admin/admin_home.dart';
import 'package:fyp/pages/login.dart';

import 'admin/admin_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  bool isLoggedIn = await SharedPreferenceHelper().getIsLoggedIn();
  Widget initialScreen = isLoggedIn ? BottomNav() : Onboard();

  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: initialScreen,
      routes: {
        '/admin': (context) => HomeAdmin(),
        '/user': (context) => BottomNav(),
      },
    );
  }
}






// Widget build(BuildContext context) {
//   return const MaterialApp(
//     // home: Home(),
//     // home: BottomNav(),
//     // home: LogIn(),
//     // home: SignUp(),
//     // home: ForgotPassword(),
//     // home: Wallet(),
//     home: Onboard(),
//     // home: AdminLogin(),
//     // home: HomeAdmin(),
//   );
// }