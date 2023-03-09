import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../commons.dart';

class InputField extends StatefulWidget {
  final String title;
  final String hint;
  final IconData icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final int? maxlines;
  final int? minLines;

  const InputField(
      {super.key,
      required this.title,
      required this.hint,
      required this.icon,
      this.maxlines,
      this.minLines,
      this.validator,
      this.obscureText,
      this.keyboardType,
      this.onChanged,
      this.onFieldSubmitted,
      this.textInputAction,
      this.readOnly,
      this.controller});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.send,
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxlines ?? 1,
          readOnly: widget.readOnly ?? false,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
              prefixIcon: Icon(widget.icon),
              hintText: widget.hint,
              labelText: widget.title,
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
