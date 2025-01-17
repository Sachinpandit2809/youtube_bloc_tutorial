import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';
import 'package:youtube_bloc_tutorial/repository/auth/login_repository.dart';

GetIt getIt = GetIt.instance;

void main() {
  seviceLocater();
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

  seviceLocater(){
    getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());
  }
