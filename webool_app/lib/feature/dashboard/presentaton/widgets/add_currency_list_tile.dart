import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/currency_symbol.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';

class AddedCurrencyListTile extends ConsumerStatefulWidget {
  const AddedCurrencyListTile({
    super.key,
    required this.index,
  });
  final int index;

  @override
  ConsumerState<AddedCurrencyListTile> createState() =>
      _AddedCurrencyListTileState();
}

class _AddedCurrencyListTileState extends ConsumerState<AddedCurrencyListTile> {
  @override
  Widget build(BuildContext context) {
    var symbols = ref.read(dashBoardingController).currencySymbols;

    return Container(
      margin: EdgeInsetsOf(context).symmetric(horizontal: Dimensions.smaller),
      padding: EdgeInsetsOf(context).all(Dimensions.smaller),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownSearch<Currency?>(
                  validator: (value) {
                    if (value == null) {
                      return 'select Currency';
                    }
                    return null;
                  },
                  popupProps: const PopupProps.bottomSheet(
                      showSelectedItems: false, showSearchBox: true),
                  items: symbols ?? [],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Select Currency",
                    ),
                  ),
                  onChanged: (val) {
                    ref
                        .watch(dashBoardingController)
                        .addedcurrency[widget.index]
                        .currency = val?.currencyCode ?? '';
                  },
                  itemAsString: (item) {
                    return item?.contryName ?? '';
                  },
                  //selectedItem: symbols ?? n,
                ),
              ),
              const Space.w(DimensionToken.smallest),
              Expanded(
                  child: TextFormField(
                controller: TextEditingController()
                  ..text = ref
                          .read(dashBoardingController)
                          .addedcurrency[widget.index]
                          .number
                          ?.toString() ??
                      '',
                inputFormatters: [DoubleInputFormatter()],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please add Amount';
                  }
                  return null;
                },
                onChanged: (val) {
                  ref
                      .watch(dashBoardingController)
                      .addedcurrency[widget.index]
                      .number = double.tryParse(val) ?? 0.0;
                },
              )),
              const Space.w(DimensionToken.smallest),
              GestureDetector(
                onTap: () {
                  ref
                      .watch(dashBoardingController)
                      .removeCUrrency(widget.index);
                },
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoubleInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only digits and a single dot
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (double.tryParse(newValue.text) == null) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}
