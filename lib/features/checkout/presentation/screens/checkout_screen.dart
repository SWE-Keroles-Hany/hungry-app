import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/cash_on_delivery_method.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/custom_divider.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/custom_label.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/order_label_with_price.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/order_time.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/order_total_with_price.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/visa_method.dart';
import 'package:hungry_app/features/products/presentation/widgets/total_price_with_action.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabel(title: "Order summary"),
              OrderLabelWithPrice(price: 16.2, title: "Order"),
              OrderLabelWithPrice(price: 0.3, title: "Taxes"),
              OrderLabelWithPrice(price: 1.5, title: "Delivery fees"),
              CustomDivider(color: AppTheme.grayF0),
              OrderTotalWithPrice(price: 10),
              OrderTime(),
              SizedBox(height: 67.h),
              CustomLabel(title: "Payment methods"),
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCashOnDeliverySelected = false;
                    isVisaSelected = true;
                  });
                },
                child: VisaMethod(isSelected: isVisaSelected),
              ),
              Spacer(),
              TotalPriceWithAction(
                width: MediaQuery.sizeOf(context).width * 0.5,
                totalPrice: 18,
                title: "Pay Now",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
