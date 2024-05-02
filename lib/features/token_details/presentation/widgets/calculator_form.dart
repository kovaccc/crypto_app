import 'package:crypto_app/features/token_details/presentation/widgets/calculator_form_field.dart';
import 'package:crypto_app/core/presentation/constants/app_sizes.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class CalculatorForm extends HookWidget {
  final double price;

  const CalculatorForm({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final priceController = useTextEditingController(text: price.toString());
    final quantityController = useTextEditingController(text: 1.toString());
    return Row(
      children: [
        Expanded(
          child: CalculatorFormField(
            textEditingController: quantityController,
            label: S.current.calculator_quantity_hint,
            hint: S.current.calculator_quantity_hint,
            onChanged: (String value) =>
                _handleQuantityChanged(value, priceController),
          ),
        ),
        const Gap(AppSizes.spacingLarge),
        Expanded(
          child: CalculatorFormField(
            textEditingController: priceController,
            label: S.current.calculator_price_hint_usd,
            hint: S.current.calculator_price_hint_usd,
            onChanged: (String value) =>
                _handlePriceChanged(value, quantityController),
          ),
        ),
      ],
    );
  }

  void _handleQuantityChanged(
      String newValue, TextEditingController priceController) {
    final quantity = double.tryParse(newValue);
    priceController.text =
        quantity != null ? (quantity * price).toString() : '';
  }

  void _handlePriceChanged(
      String newValue, TextEditingController quantityController) {
    final enteredPrice = double.tryParse(newValue);
    quantityController.text =
        enteredPrice != null ? (enteredPrice / price).toString() : '';
  }
}
