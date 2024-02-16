import 'package:ballsquad_project/feature/authors/bloc/authors_cubit.dart';
import 'package:ballsquad_project/feature/authors/views/author_view.dart';
import 'package:ballsquad_project/feature/authors/repo/authors_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorsCubit>(
          create: (context) => AuthorsCubit(SampleAuthorsRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthorsView(),
      ),
    );
  }
}
