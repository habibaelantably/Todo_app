import 'package:flutter/material.dart';

class EaseAnimation extends StatefulWidget {
  @override
  _EaseAnimationState createState() => _EaseAnimationState();
}

class _EaseAnimationState extends State<EaseAnimation>
    with TickerProviderStateMixin {
  late Animation _animation;
  late Animation Secondanimation;
  late Animation Thirdanimation;
  late Animation fourthanimation;


  late AnimationController _controller;
  late AnimationController second;
  late AnimationController third;
  late AnimationController fourth;


  @override
  void initState() {
    void listener(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(listener);
        Secondanimation.removeStatusListener(listener);
        Thirdanimation.removeStatusListener(listener);
        fourthanimation.removeStatusListener(listener);


        _controller.reset();
        second.reset();
        third.reset();
        fourth.reset();

        //fifth.reset();

      }
    }
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.slowMiddle))
      ..addStatusListener(listener);
    _controller.repeat();

    second =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    Secondanimation = Tween(begin: 1.0, end: -1.0).animate(
        CurvedAnimation(parent: second, curve: Curves.slowMiddle))
      ..addStatusListener(listener);
    second.repeat();

    third =
        AnimationController(vsync: this, duration: Duration(seconds: 9));
    Thirdanimation = Tween(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(parent: third, curve: Curves.slowMiddle))
      ..addStatusListener(listener);
    third.repeat();

    fourth =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    fourthanimation = Tween(begin: 1.0, end: -1.0).animate(
        CurvedAnimation(parent: fourth, curve: Curves.slowMiddle))
      ..addStatusListener(listener);
    fourth.repeat();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return
                      Transform.translate(
                        offset:  Offset(_animation.value * width,-250.0),
                        //transform:Matrix4.translationValues(_animation.value * width, 0.0, 0.0),

                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                                'https://freesvg.org/img/egyninja-Cartoon-Cloud.png',
                                fit:BoxFit.cover
                            ),
                          ),
                        ),);
                  },


                ),
              ),

              Container(
                child: AnimatedBuilder(
                  animation: second,
                  builder: (BuildContext context, Widget? child) {
                    return
                      Transform.translate(
                        offset:  Offset(Secondanimation.value * width,-100.0),
                        //transform:Matrix4.translationValues(_animation.value * width, 0.0, 0.0),

                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                                'https://freesvg.org/img/egyninja-Cartoon-Cloud.png',
                                fit:BoxFit.cover
                            ),
                          ),
                        ),);
                  },
                ),
              ),

              Container(
                child: AnimatedBuilder(
                  animation: third,
                  builder: (BuildContext context, Widget? child) {
                    return
                      Transform.translate(
                        offset:  Offset(Thirdanimation.value * width,120.0),
                        //transform:Matrix4.translationValues(_animation.value * width, 0.0, 0.0),

                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                                'https://freesvg.org/img/egyninja-Cartoon-Cloud.png',
                                fit:BoxFit.cover
                            ),
                          ),
                        ),);
                  },


                ),
              ),

              Container(
                child: AnimatedBuilder(
                  animation: fourth,
                  builder: (BuildContext context, Widget? child) {
                    return
                      Transform.translate(
                        offset:  Offset(fourthanimation.value * width,240.0),
                        //transform:Matrix4.translationValues(_animation.value * width, 0.0, 0.0),

                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                                'https://freesvg.org/img/egyninja-Cartoon-Cloud.png',
                                fit:BoxFit.cover

                            ),
                          ),
                        ),);
                  },


                ),
              ),


            ],
          ),
          Center(
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' Atmosphere ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      )
      );
  }
}