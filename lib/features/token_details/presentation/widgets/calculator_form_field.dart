import 'package:crypto_app/core/presentation/constants/regex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorFormField extends StatelessWidget {
  final String label;
  final String hint;
  final Function(String value) onChanged;
  final TextEditingController textEditingController;

  const CalculatorFormField(
      {super.key,
      required this.label,
      required this.hint,
      required this.onChanged,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(labelText: label, hintText: hint),
      onChanged: onChanged,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(RegexConstants.numbersWithDecimal),
        ),
      ],
    );
  }
}
