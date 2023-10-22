import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/core/ui/presentation/Status.dart';
import 'package:hello_flutter/di.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/users/UsersState.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/users/UsersViewModel.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => UsersScreenState();
}

class UsersScreenState extends State<UsersScreen> {
  late UsersViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<UsersViewModel>();
    viewModel.getUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Users"),
      ),
      body: ValueListenableBuilder<UsersState>(
          valueListenable: viewModel.state,
          builder: (context, state, _) {
            if (state is StatusState && state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StatusState && state.status == Status.error) {
              return const Center(
                child: Text('ERROR'),
              );
            }

            if (state is UserListState && state.users.isEmpty) {
              return const Center(
                child: Text('ERROR'),
              );
            }

            final users = (state as UserListState).users;
            return ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, int index) => ListTile(
                onTap: () => context.push('/users/${users[index].id}'),
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image(
                      image: CachedNetworkImageProvider(users[index].avatar ?? ''),
                    ),
                  ),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].createdAt),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }));
}
