import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/widgets/custom_loading_shimmer.dart';
import 'package:hungry_app/features/home/presentation/cubit/topping_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/toppings_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_option_list.dart';

class ToppingsProducts extends StatelessWidget {
  const ToppingsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<ToppingsCubit, ToppingsStates>(
        builder: (context, state) {
          if (state is LoadingToppingsState) {
            return CustomLoadingShimmer(
              isSideOptions: true,

              children: GetSideOptions(),
            );
          } else if (state is ErrorToppingsState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessToppingsState) {
            final toppings = state.products;
            return CustomOptionList(options: toppings);
          }
          return SizedBox();
        },
      ),
    );
  }
}
