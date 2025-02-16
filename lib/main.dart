import 'package:flutter/material.dart';
import 'package:pm2/screens/dashboard_screen.dart';
import 'package:pm2/screens/home_screen.dart';
import 'package:pm2/screens/login_screen.dart';
import 'package:pm2/screens/register_screen.dart';
import 'package:pm2/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/dashboard": (context) => DashboardScreen(),
      },
    );
  }
}
