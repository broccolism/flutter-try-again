import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransitionAnimationScreen extends StatefulWidget {
  static const name = "/transition_animation";
  const TransitionAnimationScreen({Key? key}) : super(key: key);

  @override
  _TransitionAnimationScreenState createState() =>
      _TransitionAnimationScreenState();
}

class _TransitionAnimationScreenState extends State<TransitionAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInToLinear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              _rectangle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rectangle() {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          margin: EdgeInsets.all(60),
          color: Colors.green,
          width: 300,
          height: 100,
        ),
      ),
    );
  }
}
