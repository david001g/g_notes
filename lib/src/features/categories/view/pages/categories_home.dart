import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/core/layout/LayoutTemplate.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/categories/view/pages/create_category_dialog.dart';
import 'package:g_notes/src/features/categories/view/widgets/category_page.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryRefresh) {
          context.read<AuthenticationCubit>().getUserAllData();
        }
      },
      child: LayoutTemplate(
          route: AppRoute.categories,
          topButtonTitle: 'Create Category',
          topButtonIcon: writeIcon,
          topNavigation: () => showCreateCategoryDialog(context, null),
          child: const CategoryPage()),
    );
  }
}
