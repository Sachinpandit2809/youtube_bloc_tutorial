import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/movies/movies_bloc.dart';
import 'package:youtube_bloc_tutorial/config/components/internet_exception_widget.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';
import 'package:youtube_bloc_tutorial/main.dart';
import 'package:youtube_bloc_tutorial/services/storage/local_storage.dart';
import 'package:youtube_bloc_tutorial/utils/enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;
  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
          actions: [logOutButton(context)],
        ),
        body: BlocProvider(
          create: (_) => moviesBloc..add(fetchMoviesList()),
          child: BlocBuilder<MoviesBloc, MoviesState>(
            buildWhen: (previous, current) =>
                previous.moviesList != current.moviesList,
            builder: (context, state) {
              // switch cases
              switch (state.moviesList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Text("ERRor:-" + state.moviesList.error.toString());

                case Status.COMPLETED:
                  if (state.moviesList.data! == null) {
                    return const Center(child: Text("No data Found"));
                  }
                  final movieList = state.moviesList.data;

                  return ListView.builder(
                      itemCount: movieList!.tvShows!.length,
                      itemBuilder: (context, index) {
                        final tvShow = movieList.tvShows![index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                                tvShow.imageThumbnailPath.toString()),
                          ),
                          title: Text(tvShow.name ?? "null"),
                          subtitle: Text(tvShow.network ?? "null"),
                        );
                      });
                default:
                  // TODO: Handle this case.
                  return SizedBox();
              }
            },
          ),
        ));
  }

  IconButton logOutButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          LocalStorage localStorage = LocalStorage();
          localStorage.clearValue('token').then((value) {
            localStorage.clearValue('isLogin').then((onValue) {
              Navigator.pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  RoutesName.loginScreen,
                  (route) => false);
            });
          });
        },
        icon: const Icon(Icons.logout));
  }
}
