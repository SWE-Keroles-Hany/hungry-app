import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/widgets/custom_loading_shimmer.dart';
import 'package:hungry_app/features/home/presentation/cubit/side_options_cubt.dart';
import 'package:hungry_app/features/home/presentation/cubit/side_options_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_option_list.dart';
class SideOptionsProducts extends StatelessWidget {
  const SideOptionsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<SideOptionsCubit, SideOptionsStates>(
        builder: (context, state) {
          if (state is LoadingSideOptionsState) {
            return CustomLoadingShimmer(
              isSideOptions: true,
              children: GetSideOptions(),
            );
          } else if (state is ErrorSideOptionsState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessSideOptionsState) {
            final sideOptionsProducts = state.products;
            return CustomOptionList(options: sideOptionsProducts);
          }
          return SizedBox();
        },
      ),
    );
  }
}
