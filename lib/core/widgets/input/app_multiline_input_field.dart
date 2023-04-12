import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/app_colors.dart';
import 'base_input_field.dart';

class AppMultilineInputField extends StatelessWidget {

  final String? title;
  final String? hintText;
  final bool obscureText;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final Widget? trailingIcon;
  final bool displayTitleArea;
  final bool displayOptionalText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool? filled;
  final TextInputAction textInputAction;
  final AutovalidateMode autovalidateMode;
  final bool enableInteractiveSelection;
  final FocusNode? focusNode;
  final bool? enabled;
  final String? Function(String?)? validator;

  const AppMultilineInputField(
      {Key? key,
        this.title,
        this.hintText,
        this.obscureText = false,
        this.inputFormatters,
        this.onChanged,
        this.controller,
        this.errorText,
        this.trailingIcon,
        this.displayTitleArea = false,
        this.displayOptionalText = false,
        this.suffixIcon,
        this.prefixIcon,
        this.fillColor,
        this.filled = false,
        this.textInputAction = TextInputAction.next,
        this.autovalidateMode = AutovalidateMode.onUserInteraction,
        this.enabled,
        this.validator, this.enableInteractiveSelection = true, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      title: title,
      displayOptionalText: displayOptionalText,
      inputControl: ConstrainedBox(
        constraints:  const BoxConstraints(
          maxHeight: 400,
          maxWidth: double.infinity,
        ),
        child: TextFormField(
          enabled: enabled,
          key: key,
          maxLines: null,
          minLines: 1,
          enableInteractiveSelection: enableInteractiveSelection,
          focusNode: focusNode,
          autovalidateMode: autovalidateMode,
          validator: validator,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          controller: controller ?? TextEditingController(),
          decoration: InputDecoration(
              errorText:
              (errorText == "" || errorText == null) ? null : errorText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              hintStyle: TextStyle(color: kcLightGreyColor),
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              isDense: true),
          keyboardType: TextInputType.multiline,
          textInputAction: textInputAction,
        ),
      ),
    );
  }
}
