import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/json_placeholder_user/json_placeholder_user_bloc.dart';
import 'package:youtube_bloc_tutorial/main.dart';
import 'package:youtube_bloc_tutorial/utils/enum.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late JsonPlaceholderUserBloc jsonPlaceholderUserBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jsonPlaceholderUserBloc =
        JsonPlaceholderUserBloc(jsonPlaceholderUserRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => jsonPlaceholderUserBloc..add(fetchUserDataEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User Screen'),
          ),
          body: BlocBuilder<JsonPlaceholderUserBloc, JsonPlaceholderUserState>(
              builder: (context, state) {
            switch (state.userData.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                return Center(
                  child: Text(state.userData.error.toString()),
                );
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: state.userData.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            Text(state.userData.data![index].id.toString()),
                        title:
                            Text(state.userData.data![index].name.toString()),
                        subtitle:
                            Text(state.userData.data![index].email.toString()),
                      );
                    });
              default:
                return const SizedBox();
            }
          }),
        ));
  }
}
