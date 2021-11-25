import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/search_bar_controller.dart';
import 'package:tiny_widgets/src/constants.dart';

import '../widgets.dart';

class AutoCompleteSearch extends StatefulWidget {
  const AutoCompleteSearch({Key? key}) : super(key: key);

  @override
  _AutoCompleteSearchState createState() => _AutoCompleteSearchState();
}

class _AutoCompleteSearchState extends State<AutoCompleteSearch> {
  late final OverlayEntry overlayEntry =
      OverlayEntry(builder: _overlayEntryBuilder);
  final GlobalKey _searchBarKey = GlobalKey();
  final LayerLink _searchBarLink = LayerLink();

  @override
  void initState() {
    super.initState();
    SearchBarController.to.initOverlayHandlers(
        insertOverlay: insertOverlay, removeOverlay: removeOverlay);
  }

  @override
  void dispose() {
    overlayEntry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _searchBarLink,
      child: SearchBar(
        key: _searchBarKey,
      ),
    );
  }

  void insertOverlay() {
    if (!overlayEntry.mounted) {
      OverlayState overlayState = Overlay.of(context)!;
      overlayState.insert(overlayEntry);
    }
  }

  void removeOverlay() {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  }

  Widget _overlayEntryBuilder(BuildContext context) {
    Offset position = _getOverlayEntryPosition();
    Size size = _getOverlayEntrySize();

    return Positioned(
      left: position.dx,
      top: position.dy,
      width: Get.size.width - MyConstants.SCREEN_HORIZONTAL_MARGIN.horizontal,
      child: CompositedTransformFollower(
        link: _searchBarLink,
        showWhenUnlinked: false,
        offset: Offset(0.0, size.height),
        child: AutoCompleteResult(),
      ),
    );
  }

  Offset _getOverlayEntryPosition() {
    RenderBox renderBox =
        _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
    return Offset(renderBox.localToGlobal(Offset.zero).dx,
        renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height);
  }

  Size _getOverlayEntrySize() {
    RenderBox renderBox =
        _searchBarKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size;
  }
}
