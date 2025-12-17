import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/cash_on_delivery_method.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/custom_divider.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/custom_label.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/order_label_with_price.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/order_time.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/order_total_with_price.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_cubit.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_states.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = "CheckoutScreen";
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // final List<Widget> paymentMethods = [CashOnDeliveryMethod(), VisaMethod()];
  bool isCashOnDeliverySelected = true;
  bool isVisaSelected = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final orderSummary =
        ModalRoute.of(context)!.settings.arguments as CartListResponseEntity;

    final totalPrice =
        (double.parse(orderSummary.totalPrice!) +
                double.parse("0.3") +
                double.parse("1.5"))
            .toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset("assets/icons/arrow-left.png"),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: BlocListener<OrdersCubit, OrdersStates>(
            listener: (context, state) {
              if (state is LoadingSaveOrdersState) {
                UiUtils.showLoadingIndicator(context);
              } else if (state is ErrorSaveOrdersState) {
                UiUtils.hideLoading(context);
                UiUtils.showMessage(
                  message: state.message,
                  isErrorMessage: true,
                );
                context.read<OrdersCubit>().getAllOrders();
              } else if (state is SuccessSaveOrdersState) {
                UiUtils.hideLoading(context);

                UiUtils.showMessage(
                  message: "Order Added Succfully",
                  isSuccessMessage: true,
                );
                Navigator.of(context).pop();
                context.read<OrdersCubit>().getAllOrders();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabel(title: "Order summary"),
                OrderLabelWithPrice(
                  price: orderSummary.totalPrice!,
                  title: "Order",
                ),
                OrderLabelWithPrice(price: "0.3", title: "Taxes"),
                OrderLabelWithPrice(price: "1.5", title: "Delivery fees"),
                CustomDivider(color: AppTheme.grayF0),
                OrderTotalWithPrice(price: totalPrice),
                OrderTime(),
                SizedBox(height: 67.h),
                CustomLabel(title: "Payment"),
                SizedBox(height: 22.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisaSelected = false;
                      isCashOnDeliverySelected = true;
                    });
                  },
                  child: CashOnDeliveryMethod(
                    isSelected: isCashOnDeliverySelected,
                  ),
                ),
                SizedBox(height: 25.h),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       isCashOnDeliverySelected = false;
                //       isVisaSelected = true;
                //     });
                //   },
                //   child: VisaMethod(isSelected: isVisaSelected),
                // ),
                Spacer(),
                TotalPriceWithAction(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  totalPrice: totalPrice,
                  title: "Order Now",
                  onPressed: () async {
                    final order = List.generate(
                      orderSummary.items!.length,
                      (index) => CartItemRequestEntity(
                        productId: orderSummary.items![index].productId!,
                        quantity: orderSummary.items![index].quantity!,
                        sideOptions: [],
                        spicy: double.parse(orderSummary.items![index].spicy!),
                        toppings: [],
                      ),
                    );
                    await cubit.saveOrder(order: order);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
