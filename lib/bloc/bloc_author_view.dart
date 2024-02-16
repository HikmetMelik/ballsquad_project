import 'package:ballsquad_project/bloc/authors.dart';
import 'package:ballsquad_project/bloc/authors_cubit.dart';
import 'package:ballsquad_project/bloc/authors_repo.dart';
import 'package:ballsquad_project/bloc/authors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsView extends StatefulWidget {
  const AuthorsView({super.key});
  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<AuthorsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorsCubit(SampleAuthorsRepo()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Authors'),
          centerTitle: true,
        ),
        body: BlocConsumer<AuthorsCubit, AuthorsState>(
          listener: (context, state) {
            if (state is AuthorsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthorsInitial) {
              return Center(
                child: Row(
                  children: [const Text("Wait for content"), actionButton(context)],
                ),
              );
            } else if (state is AuthorsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AuthorsLoaded) {
              return ListView.builder(
                itemCount: state.response.length,
                itemBuilder: (context, index) {
                  final author = Authors();
                  return ListTile(
                    title: Text(author.name),
                    subtitle: Text(author.birthDate),
                  );
                },
              );
            } else {
              final error = state as AuthorsError;
              return Text(error.message);
            }
          },
        ),
      ),
    );
  }

  FloatingActionButton actionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<AuthorsCubit>().getAuthors();
      },
      child: const Icon(Icons.refresh),
    );
  }
}
