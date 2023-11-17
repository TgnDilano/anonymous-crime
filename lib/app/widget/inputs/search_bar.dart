import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/extensions/context_ext.dart';

class NSearchBar extends StatefulWidget {
  const NSearchBar({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.onChange,
    this.minLines = 1,
    this.maxLines = 3,
    this.isEnabled = true,
    this.required = false,
    this.hint = "",
    this.validator,
    this.radius,
    this.hasSearchIcon = true,
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final int minLines;
  final int maxLines;
  final String hint;
  final bool isEnabled, hasSearchIcon;
  final bool required;
  final String? Function(String?)? validator;
  final double? radius;

  @override
  State<NSearchBar> createState() => _NSearchBarState();
}

class _NSearchBarState extends State<NSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      key: ValueKey(widget.hint),
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      enabled: widget.isEnabled,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      cursorColor: context.primaryColor,
      onChanged: widget.onChange,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius ?? 30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius ?? 30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.6,
            color: AppColors.kSecondary,
          ),
          borderRadius: BorderRadius.circular(widget.radius ?? 30),
        ),
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
        hintText: widget.hint,
        filled: true,
        fillColor: context.isDarkMode ? Colors.white12 : Colors.grey.shade100,
        prefixIcon: widget.hasSearchIcon
            ? Icon(
                Feather.search,
                size: 22,
                color: Colors.grey.shade600,
              )
            : null,
      ),
    );
  }
}
