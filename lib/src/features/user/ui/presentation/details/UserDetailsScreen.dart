import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/core/ui/presentation/Status.dart';
import 'package:hello_flutter/di.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/details/UserDetailsState.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/details/UserDetailsViewModel.dart';

class UserDetailsScreen extends StatefulWidget {
  final String id;

  const UserDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  State<UserDetailsScreen> createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetailsScreen> {
  late UserDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<UserDetailsViewModel>();
    viewModel.getUser(widget.id);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("User Details"),
      ),
      body: ValueListenableBuilder<UserDetailsState>(
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

            final user = (state as UserState).user;
            return Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Image(
                            width: 100,
                            height: 100,
                            image:
                                CachedNetworkImageProvider(user.avatar ?? ''),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(user.createdAt),
                      ],
                    ),
                    const Spacer(),
                  ]),
                ),
              ),
            );
          }));
}
