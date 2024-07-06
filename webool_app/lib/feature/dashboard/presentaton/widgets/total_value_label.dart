import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_common/webool_common.dart';

import '../controller/dashboard_controller.dart';

class ToTalValueLabel extends ConsumerWidget {
  const ToTalValueLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dashBoardingController);
    var theme = Theme.of(context);
    return ref.read(dashBoardingController).total != 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    ref.read(dashBoardingController).addedcurrency.length,
                itemBuilder: (context, index) {
                  var addedCurrency =
                      ref.read(dashBoardingController).addedcurrency[index];
                  if (addedCurrency.rate == null) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    margin: EdgeInsetsOf(context).symmetric(
                        horizontal: Dimensions.smaller,
                        vertical: Dimensions.smallest),
                    //padding: EdgeInsetsOf(context).all(Dimensions.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            '${addedCurrency.country} : ( Rate : ${addedCurrency.rate}) * ${addedCurrency.number.toString()}'),
                      ],
                    ),
                  );
                },
              ),
              Divider(
                color: theme.weboolColors.primaryRed,
              ),
              Padding(
                padding: EdgeInsetsOf(context).symmetric(
                    horizontal: Dimensions.smaller,
                    vertical: Dimensions.smallest),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: 'Base Currency :',
                          style: theme.textTheme.bodyMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '${ref.read(dashBoardingController).baseCurrency?.contryName} ',
                              style: theme.textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text:
                                  '(${ref.read(dashBoardingController).baseCurrency?.currencyCode})',
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Space.w(Dimensions.smaller),
                    Text(
                      'Total is : ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                        ref
                            .read(dashBoardingController)
                            .total
                            .toStringAsFixed(3),
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
