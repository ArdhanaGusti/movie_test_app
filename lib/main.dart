import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_bloc.dart';
import 'package:movie_test_app/injection.dart' as di;
import 'package:movie_test_app/presentation/pages/splash_screen.dart';
import 'package:movie_test_app/styles/colors.dart';
import 'package:movie_test_app/styles/test_style.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ActorBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        title: "Artix",
        home: const SplashScreen(),
      ),
    );
  }
}
