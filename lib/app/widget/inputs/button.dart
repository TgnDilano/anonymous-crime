import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'dart:math' as math;
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/constants/styles.dart';
import 'package:macos_ui_app/app/extensions/context_ext.dart';

class NButton extends StatelessWidget {
  const NButton({
    Key? key,
    this.text,
    this.backgroundColor = AppColors.kPrimary,
    this.onTap,
    this.isOutlined = false,
    this.isLoading = false,
    this.radius = 8,
    this.width,
    this.height,
    this.isEnabled = true,
  }) : super(key: key);

  final String? text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool isOutlined;
  final bool isLoading, isEnabled;
  final double radius;
  final double? width;
  final double? height;

  Color? getButtonColor() {
    if (isLoading) return backgroundColor;
    if (!isEnabled) return AppColors.kPrimary;
    if (isOutlined) return AppColors.kPrimary;
    return backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: isOutlined && isEnabled
                ? BorderSide(
                    color: isOutlined
                        ? Theme.of(context).primaryColor
                        : backgroundColor ?? (context.primaryColor),
                    width: 0.6,
                  )
                : BorderSide.none,
          ),
          backgroundColor: isLoading
              ? Theme.of(context).primaryColor.withOpacity(0.8)
              : isOutlined
                  ? Colors.transparent
                  : Theme.of(context).primaryColor,
        ),
        onPressed: isEnabled && !isLoading ? onTap : null,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeIn,
          child: isLoading
              ? const CupertinoActivityIndicator(
                  animating: true,
                  color: Colors.white,
                  radius: 14,
                )
              : Text(
                  text ?? "OK",
                  maxLines: 1,
                  style: TextStyle(
                    color: isOutlined
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}

class CircleButtom extends StatelessWidget {
  const CircleButtom({
    super.key,
    this.scale = 1,
    this.icon = const Icon(
      Feather.camera,
      color: Colors.white,
    ),
    this.onTap,
    this.backgroundColor,
  });

  final double scale;
  final Widget icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scale: scale,
        child: CircleAvatar(
          radius: 26,
          backgroundColor:
              backgroundColor ?? backgroundColor ?? context.primaryColor,
          child: icon,
        ),
      ),
    );
  }
}

class ChipButton extends StatelessWidget {
  const ChipButton({
    super.key,
    this.bgColor = AppColors.kSecondary,
    required this.title,
  });

  final Color bgColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: bgColor.withOpacity(0.2),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: bgColor,
        ),
      ),
    );
  }
}

class DropDownLikeButton extends StatelessWidget {
  const DropDownLikeButton({
    super.key,
    this.backgroundColor = AppColors.kSecondary,
    this.withBorder = false,
    this.iconColor = Colors.white,
    required this.text,
    this.onTap,
  });

  final Color backgroundColor, iconColor;
  final bool withBorder;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 38,
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(withBorder ? 0.4 : 1),
              borderRadius: BorderRadius.circular(40.0),
              border: withBorder
                  ? Border.all(
                      color: backgroundColor,
                      width: 0.7,
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  Transform.rotate(
                    angle: math.pi / 2,
                    child: Icon(
                      Icons.chevron_right,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
