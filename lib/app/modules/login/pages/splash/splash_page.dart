import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({this.title = "SplashPage"}) : super();
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    //   ..addStatusListener((state) => print('$state'));
    // controller.forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // controller.reverse();
          Future.delayed(Duration(seconds: 1))
              .then((value) => Modular.to.navigate('login'));
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final _opacityTween = Tween<double>(begin: 0.1, end: 1);
    final _sizeTween = Tween<double>(begin: 0, end: 200);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityTween.evaluate(animation),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: _sizeTween.evaluate(animation),
                    width: _sizeTween.evaluate(animation),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityTween.evaluate(animation),
                  child: Text("Chat Online Hasura",
                      style: TextStyle(
                          fontSize: _sizeTween.evaluate(animation) * 0.20),
                      textAlign: TextAlign.center),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
