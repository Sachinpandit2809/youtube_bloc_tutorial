import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/components/internet_exception_widget.dart';
import 'package:youtube_bloc_tutorial/config/components/loading_widget.dart';
import 'package:youtube_bloc_tutorial/config/components/round_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InternetExceptionWidget(
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
