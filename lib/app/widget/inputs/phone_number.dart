import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/constants/styles.dart';
import 'package:macos_ui_app/app/extensions/context_ext.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';

class NPhoneNumberInput extends StatefulWidget {
  const NPhoneNumberInput({
    super.key,
    this.onInputChanged,
    this.validator,
    this.initialValue,
    this.controller,
    this.isEnabled = true,
    this.required = false,
    required this.title,
    this.hintText = "",
    this.showFlag = false,
  });

  final Function(PhoneNumber)? onInputChanged;
  final String? Function(String?)? validator;
  final PhoneNumber? initialValue;
  final TextEditingController? controller;
  final bool isEnabled, required, showFlag;
  final String? title;
  final String hintText;

  @override
  State<NPhoneNumberInput> createState() => _NPhoneNumberInputState();
}

class _NPhoneNumberInputState extends State<NPhoneNumberInput> {
  final isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title ?? '',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall,
                      ),
                      6.width,
                      AnimatedOpacity(
                        duration: 350.milliseconds,
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
                ],
              ),
              10.height,
            ],
          ),
        Obx(
          () => Container(
            key: UniqueKey(),
            decoration: BoxDecoration(
              border: Border.all(
                color: isFocused.value
                    ? context.secondaryColor
                    : Theme.of(context).iconTheme.color!,
                width: 0.5,
              ),
              color: Colors.transparent,
              borderRadius: kBorderRadius,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 12,
                  ),
                  child: InternationalPhoneNumberInput(
                    autoValidateMode: AutovalidateMode.disabled,
                    isEnabled: widget.isEnabled,
                    validator: (p0) {
                      return null;
                    },
                    onInputChanged: widget.onInputChanged,
                    inputBorder: InputBorder.none,
                    textFieldController: widget.controller,
                    formatInput: true,
                    selectorTextStyle: context.textTheme.bodyMedium,
                    textStyle: context.textTheme.bodyMedium,
                    selectorConfig: SelectorConfig(
                      showFlags: widget.showFlag,
                      selectorType: PhoneInputSelectorType.DIALOG,
                      leadingPadding: 0,
                      trailingSpace: true,
                    ),
                    inputDecoration: InputDecoration(
                      hintText: widget.hintText,
                      labelStyle: context.textTheme.displaySmall,
                      hintStyle: context.textTheme.displaySmall,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        gapPadding: 0,
                      ),
                    ),
                    initialValue: widget.initialValue ??
                        PhoneNumber(
                          isoCode: "CM",
                        ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                ),
                Positioned(
                  left: widget.showFlag ? 115 : 80,
                  child: Obx(
                    () => Container(
                      height: 65,
                      width: 0.5,
                      color: isFocused.value
                          ? context.secondaryColor
                          : Theme.of(context).iconTheme.color!,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class HomeController {
}
