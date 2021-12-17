import 'package:flutter/material.dart';

enum OmokColor { BLACK, WHITE }
enum OmokStone { EMPTY, BLACK, WHITE }

extension OmokColorExtension on OmokColor {
  String toStringShort() {
    switch (this) {
      case OmokColor.BLACK:
        return "black";

      case OmokColor.WHITE:
        return "white";
    }
  }

  OmokStone toStone() {
    switch (this) {
      case OmokColor.BLACK:
        return OmokStone.BLACK;

      case OmokColor.WHITE:
        return OmokStone.WHITE;
    }
  }

  OmokColor oppositeOmokColor() {
    switch (this) {
      case OmokColor.BLACK:
        return OmokColor.WHITE;

      case OmokColor.WHITE:
        return OmokColor.BLACK;
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

extension OmokStoneExtension on OmokStone {
  bool isEmpty() {
    return this == OmokStone.EMPTY;
  }

  bool isNotEmpty() {
    return this != OmokStone.EMPTY;
  }

  OmokColor? toOmokColor() {
    switch (this) {
      case OmokStone.EMPTY:
        return null;
      case OmokStone.BLACK:
        return OmokColor.BLACK;
      case OmokStone.WHITE:
        return OmokColor.WHITE;
    }
  }
}
