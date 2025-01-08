import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Bloc Tutorial',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: RoutesName.splashScreen,
    onGenerateRoute: Routes.generateRoute,
  
    );
  }
}
