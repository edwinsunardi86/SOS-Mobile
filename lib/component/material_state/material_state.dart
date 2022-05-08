import 'package:flutter/material.dart';

// class ButtonBackgroundColor implements MaterialStateProperty<Color?> {
//   final BuildContext context;

//   ButtonBackgroundColor(this.context);
//   @override
//   Color? resolve(Set<MaterialState> states) {
//     if (states.contains(MaterialState.focused) ||
//         states.contains(MaterialState.hovered)) {
//       return Colors.blue.shade200;
//     } else if (states.contains(MaterialState.pressed)) {
//       return Colors.blue.shade900;
//     }
//     return Colors.blue;
//   }
// }

class ButtonBackgroundColor {
  // final BuildContext context;

  // ButtonBackgroundColor(this.context);
//   @override
  static Color? btnPrimary(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.hovered)) {
      return Colors.blue.shade200;
    } else if (states.contains(MaterialState.pressed)) {
      return Colors.blue.shade900;
    }
    return Colors.blue;
  }

  static Color? btnDanger(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.hovered)) {
      return Colors.red.shade200;
    } else if (states.contains(MaterialState.pressed)) {
      return Colors.red.shade900;
    }
    return Colors.red;
  }

  static Color? btnSuccess(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.hovered)) {
      return Colors.green.shade200;
    } else if (states.contains(MaterialState.pressed)) {
      return Colors.green.shade900;
    }
    return Colors.green;
  }

  static Color? btnInfo(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.hovered)) {
      return Colors.blueGrey.shade200;
    } else if (states.contains(MaterialState.pressed)) {
      return Colors.blueGrey.shade900;
    }
    return Colors.blueGrey;
  }
}

class WidgetCursor extends MaterialStateMouseCursor {
  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return SystemMouseCursors.forbidden;
    }
    return SystemMouseCursors.click;
  }

  @override
  // ignore: todo
  // TODO: implement debugDescription
  String get debugDescription => 'WidgetCursor';
}

class SelectedBorder implements MaterialStateOutlinedBorder {
  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const RoundedRectangleBorder();
    }
    return null;
  }

  @override
  ShapeBorder operator +(ShapeBorder other) {
    // ignore: todo
    // TODO: implement +
    return add(other) ??
        other.add(this, reversed: true) ??
        _CompoundBorder(<ShapeBorder>[other, this]);
  }

  @override
  ShapeBorder? add(ShapeBorder other, {bool reversed = false}) {
    // ignore: todo
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    // ignore: todo
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // ignore: todo
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // ignore: todo
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // ignore: todo
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    // ignore: todo
    // TODO: implement lerpFrom
    throw UnimplementedError();
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    // ignore: todo
    // TODO: implement lerpTo
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // ignore: todo
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // ignore: todo
    // TODO: implement scale
    throw UnimplementedError();
  }

  @override
  // ignore: todo
  // TODO: implement side
  BorderSide get side => throw UnimplementedError();

  // ignore: non_constant_identifier_names
  _CompoundBorder(List<ShapeBorder> list) {}
}
