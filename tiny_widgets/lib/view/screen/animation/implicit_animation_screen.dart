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
  final String DETAIL_BUTTON_TEXT = "Show details";
  final String BODY_TEXT = "Type: Broccoli\nAge: 3\nJob: Being in a spoon";

  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32),
              _title(),
              SizedBox(height: 16),
              _image(),
              SizedBox(height: 24),
              _detailButton(),
              SizedBox(height: 16),
              _body(),
            ],
          ),
        ),
      ),
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
      onPressed: () => setState(() => opacity = 1.0),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green[100]!),
      ),
      child: Text(
        DETAIL_BUTTON_TEXT,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }

  Widget _body() {
    return AnimatedOpacity(
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
}
