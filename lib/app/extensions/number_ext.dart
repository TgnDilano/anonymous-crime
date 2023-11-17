import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Box on num {
  ///Creates a sized box with the given number of space
  SizedBox get height {
    return SizedBox(
      height: toDouble(),
      width: 0,
    );
  }

  Widget get sliverHeight {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: toDouble(),
        width: 0,
      ),
    );
  }

  ///Creates a sized box with the given number of space
  Widget get width {
    return SizedBox(
      height: 0,
      width: toDouble(),
    );
  }

  ///Formats given number to thousand.
  String toThousandFormatter({
    String separator = 'k',
    maximumFractionDigits = 2,
  }) {
    if (separator == "k") {
      final formatter = NumberFormat.compact();
      formatter.maximumFractionDigits = maximumFractionDigits;
      formatter.significantDigitsInUse = false;
      return formatter.format(this);
    }

    RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return toStringAsFixed(4).replaceAll(re, separator);
  }
}

extension TypeNotifier<T> on T {
  ValueNotifier<T> get vn {
    return ValueNotifier<T>(this);
  }
}
