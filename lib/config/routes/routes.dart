import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';

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

       
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}