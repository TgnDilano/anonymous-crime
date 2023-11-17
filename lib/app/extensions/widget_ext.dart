import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// add Padding Property to widget
extension WidgetPaddingX on Widget {
  Widget get sliver {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  SingleChildScrollView get horizontalScrollView {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: this,
    );
  }

  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget get paddingZero => Padding(
        padding: EdgeInsets.zero,
        child: this,
      );

  Widget get toAnimatedSwitcher {
    return AnimatedSwitcher(
      duration: 200.milliseconds,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      child: this,
    );
  }
}

extension ValueNotifierX<T> on ValueNotifier<T> {
  Widget watch({required Widget Function(T value) onData}) {
    return ValueListenableBuilder(
      valueListenable: this,
      builder: (context, value, child) => onData(value),
    );
  }
}
