import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/features/notes/view/bloc/pagination_cubit.dart';


class CurrentPageDisplay extends StatelessWidget {
  const CurrentPageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int totalPages = context.read<PaginationCubit>().getTotalPage;
    return BlocBuilder<PaginationCubit, PaginationState>(
      builder: (context, state) {
        final int currentPage = context.read<PaginationCubit>().getCurrentPage;
        return Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Text(
            '$currentPage | $totalPages',
            style: Theme.of(context).textTheme.paginationFontNotActive,
          ),
        );
      },
    );
  }
}
