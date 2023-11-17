import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/constants/styles.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';

class NInputField extends StatefulWidget {
  const NInputField({
    super.key,
    this.controller,
    this.title = "",
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPwd = false,
    this.onChange,
    this.minLines = 1,
    this.maxLines = 3,
    this.isEnabled = true,
    this.required = false,
    this.desc = "",
    this.suffixIcon,
    this.hintText = "",
    this.initialValue,
    this.maxChars,
    this.isReadOnly = false,
    this.subTitle = "",
    this.maxLength,
    this.noValidation = false,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final String title, desc, hintText, subTitle;
  final String? initialValue;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final int minLines, maxLines;
  final bool isEnabled, required, isPwd, isReadOnly, noValidation;
  final int? maxChars, maxLength;
  final Widget? suffixIcon;
  final Iterable<String>? autofillHints;

  @override
  State<NInputField> createState() => _NInputFieldState();
}

class _NInputFieldState extends State<NInputField> {
  final showPassword = true.vn;
  final numOfChar = 0.vn;

  Widget? buildSuffix() {
    if (widget.suffixIcon != null) return widget.suffixIcon;
    return !widget.isPwd
        ? const SizedBox.shrink()
        : IconButton(
            icon: showPassword.value
                ? const Icon(
                    Icons.cabin,
                    color: AppColors.kSecondary,
                  )
                : const Icon(
                    Icons.tab,
                    color: AppColors.kSecondary,
                  ),
            onPressed: () {
              showPassword.value = !showPassword.value;
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: widget.subTitle.isNotEmpty
                        ? context.textTheme.bodyMedium
                        : context.textTheme.bodySmall,
                  ),
                  6.width,
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 350),
                    opacity: widget.required ? 1 : 0,
                    child: const Text(
                      "*",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.kSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.desc.isNotEmpty || widget.maxChars != null)
                ValueListenableBuilder(
                  valueListenable: numOfChar,
                  builder: (context, value, child) {
                    return Text(
                      "$value/${widget.maxChars ?? widget.desc.split('/').last}",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall,
                    );
                  },
                ),
            ],
          ).paddingOnly(bottom: 2),
        if (widget.subTitle.isNotEmpty)
          Text(
            widget.subTitle,
            textAlign: TextAlign.left,
            style: context.textTheme.bodySmall!.copyWith(fontSize: 13.5),
          ),
        12.height,
        ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (context, showPwd, child) {
            return TextFormField(
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: widget.isReadOnly,
              textInputAction: TextInputAction.next,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              obscureText: widget.isPwd ? showPwd : false,
              keyboardType: widget.keyboardType,
              enabled: widget.isEnabled,
              minLines: widget.isPwd ? 1 : widget.minLines,
              maxLines: widget.isPwd ? 1 : widget.maxLines,
              maxLength: widget.maxLength,
              inputFormatters: widget.maxChars != null
                  ? [
                      LengthLimitingTextInputFormatter(widget.maxChars),
                    ]
                  : [],
              cursorColor: AppColors.kSecondary,
              initialValue: widget.initialValue,
              autofillHints: widget.autofillHints,
              onChanged: (str) {
                widget.onChange?.call(str);
                if (widget.maxChars != null) {
                  numOfChar.value = str.length;
                }
              },
              style: widget.minLines > 1
                  ? Theme.of(context).textTheme.bodySmall
                  : Theme.of(context).textTheme.bodyMedium,
              decoration: getInputDecoration(context).copyWith(
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13, height: 1.5),
                suffixIcon: buildSuffix(),
              ),
              validator: (str) {
                if (widget.noValidation) {
                  return null;
                }

                if (!widget.required) return null;

                if (str == null || str.isEmpty) {
                  return "No empty fields";
                }
                if (widget.keyboardType == TextInputType.emailAddress &&
                    !str.isEmail) {
                  return "Enter valid email.";
                }
                if (widget.validator != null) {
                  return widget.validator!.call(str);
                }
                return null;
              },
            );
          },
        )
      ],
    );
  }
}

class Feather {
}
