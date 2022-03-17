import 'package:flutter/material.dart';

class EaseIn extends StatefulWidget {
  final Widget child;
  final Function onTap;
  const EaseIn({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  _EaseInState createState() => _EaseInState();
}

class _EaseInState extends State<EaseIn> with TickerProviderStateMixin<EaseIn> {
  late AnimationController controller;
  late Animation<double> easeIn;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      value: 1.0,
    );

    easeIn = Tween(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward().then(
              (value) => {
                controller.reverse().then((value) => {widget.onTap()})
              },
            );
      },
      child: ScaleTransition(
        scale: easeIn,
        child: widget.child,
      ),
    );
  }
}
