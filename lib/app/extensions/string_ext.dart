import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension WdgetString on String {
  Widget toSvg({double width = 20, double height = 20, color = Colors.black}) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }

  String get initials {
    var list = split(" ");
    var init = "";
    for (var e in list) {
      if (e.trim().isNotEmpty) {
        init += e[0];
      }
    }

    try {
      if (list.length >= 2) {
        return init.substring(0, 2);
      } else {
        return init.substring(0, 1);
      }
    } catch (e) {
      return "";
    }
  }
}
