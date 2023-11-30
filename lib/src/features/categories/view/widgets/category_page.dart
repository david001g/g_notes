import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/common/empty_indicator.dart';
import 'package:g_notes/src/common/loading_indicator.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/categories/view/widgets/components/card_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getCategories();
    return Container(
      width: 838.w,
      height: 750.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if(state is CategoryLoading){
            return const LoadingIndicator();
          }
          else if(state is CategoryEmpty){
            return const EmptyIndicator(width: 400, height: 400);
          }else{
            final categories = context
                .read<CategoryCubit>()
                .categories;
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    CategoryEntity? category = categories[index];
                    return CardItem(category: category,);
                  }),
            );
          }
        },
      ),
    );
  }
}


