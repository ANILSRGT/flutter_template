import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extension/all_extensions.dart';

class CenterTextFormField extends StatefulWidget {
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool readOnly;
  final bool obscureText;
  final String obscuringCharacter;
  final bool? enabled;
  final FocusNode? focusNode;
  const CenterTextFormField({
    super.key,
    this.width,
    this.height,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.textStyle,
    this.foregroundColor,
    this.backgroundColor,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onSaved,
    this.validator,
    this.onTapOutside,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enabled,
    this.focusNode,
  });

  @override
  State<CenterTextFormField> createState() => _CenterTextFormFieldState();
}

class _CenterTextFormFieldState extends State<CenterTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(context.lowValue),
      ),
      child: Center(
        child: TextFormField(
          focusNode: widget.focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          onSaved: widget.onSaved,
          validator: widget.validator,
          onTapOutside: widget.onTapOutside,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          enabled: widget.enabled,
          controller: widget.controller,
          initialValue: widget.initialValue,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.center,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          style: widget.textStyle?.copyWith(
            color: widget.foregroundColor,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
