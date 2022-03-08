import 'package:civilimall/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      addSlide('test', 'test', Constant.logo, Constant.primary),
    );
    slides.add(
      addSlide('test', 'test', Constant.logo, Constant.primary),
    );
    slides.add(
      addSlide('test', 'test', Constant.logo, Constant.primary),
    );
  }

  Slide addSlide(String title, String description, String path, Color color) {
    return new Slide(
      title: title,
      description: description,
      pathImage: path,
      backgroundColor: color,
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.pushNamedAndRemoveUntil(
        context, Constant.routeAuthen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
