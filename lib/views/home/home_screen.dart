import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/components/internet_exception_widget.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';
import 'package:youtube_bloc_tutorial/services/storage/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                LocalStorage localStorage = LocalStorage();
                localStorage.clearValue('token').then((value) {
                  localStorage.clearValue('isLogin').then((onValue) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.loginScreen, (route) => false);
                  });
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Home"),
            )
          ],
        ),
      ),
    );
  }
}
