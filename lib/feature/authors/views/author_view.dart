import 'package:ballsquad_project/product/base/constants/app_constants.dart';

import '../../../exports.dart';

final class AuthorsView extends StatefulWidget {
  const AuthorsView({super.key});
  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

final class _AuthorsViewState extends State<AuthorsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextField(
              onSubmitted: (value) {
                if (value.isEmpty) return;
                context.read<AuthorsCubit>().getAuthors(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search for authors',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Flexible(
            child: BlocConsumer<AuthorsCubit, AuthorsState>(
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.emoji_people_outlined, size: 50),
                      const SizedBox(width: 10),
                      Text(AppConstants.initialPageMessage),
                    ],
                  );
                } else if (state is AuthorsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AuthorsLoaded) {
                  return ListView.builder(
                    itemCount: state.response.docs?.length ?? 0,
                    itemBuilder: (context, index) {
                      final author = state.response.docs?[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            if (author == null) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AuthorDetailsPage(authorDetails: author),
                              ),
                            );
                          },
                          title: Text(author?.name ?? ""),
                          subtitle: Text(author?.birthDate ?? ""),
                        ),
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
        ],
      ),
    );
  }
}
