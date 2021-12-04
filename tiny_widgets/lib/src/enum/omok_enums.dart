import 'package:flutter/material.dart';

enum OmokColor { BLACK, WHITE }
enum OmokStone { EMPTY, BLACK, WHITE }

extension Converter on OmokColor {
  String toStringShort() {
    switch (this) {
      case OmokColor.BLACK:
        return "black";

      case OmokColor.WHITE:
        return "white";
    }
  }

  Color color() {
    switch (this) {
      case OmokColor.BLACK:
        return Colors.black;

      case OmokColor.WHITE:
        return Colors.white;
    }
  }

  Color oppositeColor() {
    switch (this) {
      case OmokColor.BLACK:
        return Colors.white;

      case OmokColor.WHITE:
        return Colors.black;
    }
  }
}
