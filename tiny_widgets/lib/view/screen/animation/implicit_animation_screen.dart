import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  static const name = "/implicit_animation";
  const ImplicitAnimationScreen({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationScreenState createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  final String TITLE = "I 💚 broccoli";
  final String IMAGE_NAME = "assets/images/broccoli.jpg";
  final String SHOW_DETAIL_BUTTON_TEXT = "Show details";
  final String HIDE_DETAIL_BUTTON_TEXT = "Hide details";
  final String CHANGE_BUTTON_TEXT = "Chnage";
  final String BODY_TEXT = "Type: Broccoli\nAge: 3\nJob: Being in a spoon";
  final ButtonStyle _buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[100]!),
  );

  // TODO: make a controller and let it manage variables.
  double opacity = 0.0;
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = _randomBorderRadius();
    margin = _randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 48),
              _imageAndDetails(),
              _divider(),
              SizedBox(height: 48),
              _animatingShape(),
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageAndDetails() {
    return Column(
      children: [
        _title(),
        SizedBox(height: 16),
        _image(),
        SizedBox(height: 24),
        _detailButton(),
        SizedBox(height: 16),
        _body(),
      ],
    );
  }

  Widget _title() {
    return Text(
      TITLE,
      style: Theme.of(context).textTheme.headline3,
    );
  }

  Widget _image() {
    return Image.asset(IMAGE_NAME);
  }

  Widget _detailButton() {
    return TextButton(
      onPressed: () => setState(() => opacity = 1 - opacity),
      style: _buttonStyle,
      child: Text(
        opacity == 1.0 ? HIDE_DETAIL_BUTTON_TEXT : SHOW_DETAIL_BUTTON_TEXT,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }

  Widget _body() {
    return AnimatedOpacity(
      curve: Curves.bounceIn,
      opacity: opacity,
      duration: const Duration(seconds: 1),
      child: Text(
        BODY_TEXT,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.green[700]),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _divider() {
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 1,
          color: Colors.grey[400],
        ),
        SizedBox(height: 12)
      ],
    );
  }

  Widget _animatingShape() {
    return Column(
      children: [
        SizedBox(
          width: 128,
          height: 128,
          child: AnimatedContainer(
            curve: Curves.slowMiddle,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            duration: const Duration(milliseconds: 500),
          ),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: _change,
          style: _buttonStyle,
          child: Text(
            CHANGE_BUTTON_TEXT,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ],
    );
  }

  void _change() {
    setState(() {
      color = _randomColor();
      borderRadius = _randomBorderRadius();
      margin = _randomMargin();
    });
  }

  double _randomBorderRadius() {
    return Random().nextDouble() * 64;
  }

  double _randomMargin() {
    return Random().nextDouble() * 64;
  }

  Color _randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }
}
