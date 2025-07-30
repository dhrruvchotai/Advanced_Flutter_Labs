import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHelloWorldWidget extends StatefulWidget {
  const CustomHelloWorldWidget({super.key});

  @override
  State<CustomHelloWorldWidget> createState() => _CustomHelloWorldWidgetState();
}

class _CustomHelloWorldWidgetState extends State<CustomHelloWorldWidget>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late Animation _customTextAnimation;
  late AnimationController _emojiAnimationController;
  late Animation _customEmojiAnimation;
  late AnimationController _containerAnimationController;
  late Animation _customContainerAnimation;
  @override
  void initState() {
    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _customTextAnimation = Tween(
      begin: 0.0,
      end: 130.0,
    ).animate(_textAnimationController);
    _customTextAnimation.addListener(() {
      setState(() {});
    });
    _textAnimationController.repeat(reverse: true);
    _emojiAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _customEmojiAnimation = Tween(
      begin: 30.0,
      end: 200.0,
    ).animate(_emojiAnimationController);
    _customEmojiAnimation.addListener(() {
      setState(() {});
    });
    _emojiAnimationController.repeat(reverse: true);
    _containerAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _customContainerAnimation = Tween(
      begin: 0,
      end: 750.0,
    ).animate(_textAnimationController);
    _customContainerAnimation.addListener(() {
      setState(() {});
    });
    _containerAnimationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              child: Text(
                "➕",
                style: TextStyle(fontSize: _customEmojiAnimation.value),
              ),
              angle: _customEmojiAnimation.value,
            ),
            Center(
              child: Container(
                width: _customContainerAnimation.value,
                child: Text(
                  " Hello World ",
                  softWrap: false,
                  style: GoogleFonts.happyMonkey(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontSize: _customTextAnimation.value,
                  ),
                ),
              ),
            ),
            Transform.rotate(
              child: Text(
                "➕",
                style: TextStyle(fontSize: _customEmojiAnimation.value),
              ),
              angle: _customEmojiAnimation.value,
            ),
          ],
        ),
      ),
    );
  }
}
