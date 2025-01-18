import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';
import 'package:youtube_bloc_tutorial/views/users/user_screen.dart';

// all exports from screen files
import '../../views/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.userScreen:
        return MaterialPageRoute(builder: (context) => const UserScreen());

       
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}