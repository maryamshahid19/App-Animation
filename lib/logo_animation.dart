import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  bool _enlarged = false;

  @override
  void initState() {
    super.initState();

    //explicit animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    //implicit animation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _enlarged = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fade In Logo Animation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation, //explicit animation
          child: AnimatedContainer(
            duration: Duration(seconds: 2), //implicit animation
            width: _enlarged ? 200 : 100,
            height: _enlarged ? 200 : 100,
            curve: Curves.easeInOut,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
