import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/constants/styles.dart';

class NDropDownButton extends StatefulWidget {
  const NDropDownButton({
    Key? key,
    this.backgroundColor = AppColors.kSecondary,
    this.items = const ['Euro', 'Dollars'],
    this.onChanged,
    this.dropDownValue,
    this.isExpanded = false,
    this.withBorder = false,
    this.iconColor = Colors.white,
    this.labelStyle,
    this.hasLeadingLogo = false,
  }) : super(key: key);

  final Color backgroundColor, iconColor;
  final List<String> items;
  final String? dropDownValue;
  final Function(String?)? onChanged;
  final bool isExpanded;
  final bool withBorder, hasLeadingLogo;
  final TextStyle? labelStyle;

  @override
  State<NDropDownButton> createState() => _NDropDownButtonState();
}

class _NDropDownButtonState extends State<NDropDownButton> {
  final dropvalue = "".obs;

  @override
  initState() {
    super.initState();
    dropvalue.value = widget.items.first.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor.withOpacity(widget.withBorder ? 0.4 : 1),
        borderRadius: BorderRadius.circular(50.0),
        border: widget.withBorder
            ? Border.all(
                color: widget.backgroundColor,
                width: 0.7,
              )
            : null,
      ),
      child: Row(
        children: [
          if (widget.hasLeadingLogo) const CircularProgressIndicator(),
          Obx(
            () => DropdownButton(
              value: dropvalue.value.trim(),
              elevation: 0,
              isExpanded: widget.isExpanded,
              padding: const EdgeInsets.all(0),
              underline: const SizedBox.shrink(),
              dropdownColor: context.isDarkMode ? Colors.black : Colors.white,
              icon: Transform.rotate(
                angle: math.pi / 2,
                child: Icon(
                  Icons.chevron_right,
                  color: widget.iconColor,
                ),
              ),
              alignment: AlignmentDirectional.center,
              items: widget.items
                  .toSet()
                  .map((e) => DropdownMenuItem(
                        value: e.trim(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            e.trim(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 13,
                                ),
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (newValue) {
                if (newValue == null) return;
                if (widget.onChanged != null) {
                  widget.onChanged!.call(newValue);
                }
                dropvalue.value = newValue;
              },
            ),
          )
        ],
      ),
    );
  }
}

class ElevatedDropDown extends StatefulWidget {
  const ElevatedDropDown({
    super.key,
    required this.items,
    this.onChange,
  });

  final List<String> items;
  final Function(String?)? onChange;

  @override
  State<ElevatedDropDown> createState() => _ElevatedDropDownState();
}

class _ElevatedDropDownState extends State<ElevatedDropDown> {
  final value = "".obs;

  @override
  void initState() {
    value.value = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: getBoxShadow(context),
        border: context.isDarkMode
            ? Border.all(
                width: 1.2,
                color: Colors.black,
              )
            : null,
      ),
      child: Obx(
        () => DropdownButton(
          icon: Transform.rotate(
            angle: math.pi / 2,
            child: Icon(
              Icons.chevron_right,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          elevation: 0,
          value: value.value,
          style: context.textTheme.bodyMedium,
          dropdownColor: Theme.of(context).cardColor,
          underline: const SizedBox.shrink(),
          items: widget.items.map(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                ),
              );
            },
          ).toList(),
          onChanged: (str) {
            if (str != null) {
              value.value = str;
              widget.onChange?.call(str);
            }
          },
        ),
      ),
    );
  }
}
