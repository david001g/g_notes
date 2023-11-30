import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/features/notes/view/bloc/pagination_cubit.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/pagination/components/pagination_indicator.dart';
import 'package:gap/gap.dart';

class PaginationNumbers extends StatelessWidget {
  const PaginationNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PaginationCubit, PaginationState>(
      builder: (context, state) {
        print(state.runtimeType);
        final int currentPage = context.read<PaginationCubit>().getCurrentPageIndex;
        final int totalPages = context.read<PaginationCubit>().getTotalPage;
        //print('current page: $currentPage');
        //print('total page: $totalPages');
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: totalPages == 0 ? 1 : totalPages,
            itemBuilder: (context, index) {
              final bool isActive = index == currentPage;
              return InkWell(
                onTap: () {
                  context.read<PaginationCubit>().jumpToPage(index);
                },
                child: SizedBox(
                  width: 50.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(10.h),
                      Text(
                        '${index + 1}',
                        style: isActive
                            ? Theme.of(context).textTheme.paginationFontActive
                            : Theme.of(context)
                                .textTheme
                                .paginationFontNotActive,
                      ),
                      isActive ? const PaginationIndicator() : Gap(8.h),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
