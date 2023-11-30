import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_page_components/profile_page_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationCubit>().getUserAllData(); // get user data
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ProfilePageContainer(
            user: context.read<AuthenticationCubit>().user,
            notesLength: context.read<AuthenticationCubit>().notesCount,
            categoriesLength:
                context.read<AuthenticationCubit>().categoriesCount,
          );
        }
      },
    );
  }
}
