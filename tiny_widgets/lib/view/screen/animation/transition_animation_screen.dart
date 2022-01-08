import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class TransitionAnimationScreen extends StatefulWidget {
  static const name = "/transition_animation";
  const TransitionAnimationScreen({Key? key}) : super(key: key);

  @override
  _TransitionAnimationScreenState createState() =>
      _TransitionAnimationScreenState();
}

class _TransitionAnimationScreenState extends State<TransitionAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _opacityController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _opacityAnimation = CurvedAnimation(
    parent: _opacityController,
    curve: Curves.easeInToLinear,
  );

  late final AnimationController _rotationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
    upperBound: 0.6,
  );
  late final Animation<double> _rotationAnimation =
      CurvedAnimation(parent: _rotationController, curve: Curves.bounceIn);

  final String TAP_ME_TEXT = "Tap me to rotate.";

  @override
  void dispose() {
    _opacityController.dispose();
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
              _fadingRect(),
              MyDivider(),
              _rotatingRect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fadingRect() {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          margin: EdgeInsets.all(60),
          color: Colors.green,
          width: 300,
          height: 100,
        ),
      ),
    );
  }

  Widget _rotatingRect() {
    return Center(
      child: RotationTransition(
        turns: _rotationAnimation,
        child: GestureDetector(
          onTap: () {
            switch (_rotationController.status) {
              case AnimationStatus.dismissed:
                _rotationController.forward();
                break;
              case AnimationStatus.completed:
                _rotationController.reverse();
                break;
              default:
            }

            // TODO: 이렇게 하면 안된다고 적기.
            // _rotationController.forward();
            // _rotationController.reverse();
          },
          child: Container(
            margin: EdgeInsets.all(90),
            color: Colors.lightGreen,
            width: 300,
            height: 100,
            child: Center(
              child: Text(TAP_ME_TEXT),
            ),
          ),
        ),
      ),
    );
  }
}
