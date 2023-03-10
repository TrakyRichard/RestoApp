import 'package:flutter/material.dart';

class DropDownMenu<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? dropdownItems;
  final T selectedValue;
  final String label;
  final void Function(T?)? onChanged;
  const DropDownMenu(
      {super.key,
      required this.dropdownItems,
      required this.onChanged,
      required this.label,
      required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500)),
          DropdownButton<T>(
              isExpanded: true,
              hint: const Text("Select"),
              value: selectedValue,
              onChanged: onChanged,
              items: dropdownItems),
        ],
      ),
    );
  }
}
