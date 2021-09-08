import 'package:flutter/material.dart';

class animationScreen extends StatefulWidget {
  @override
  _animationScreenState createState() => _animationScreenState();
}

class _animationScreenState extends State<animationScreen> with SingleTickerProviderStateMixin {


  late AnimationController _controller;
  Animation<double>? animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds:5000));
    animation = Tween(begin: -2.0, end: 300.0).animate(_controller);
    _controller.repeat(period:Duration(milliseconds: 3000) );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Title")),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
              children: <Widget>[
                Transform.translate(
                  child: Container(width: 100, height: 100,child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit:BoxFit.cover
                  ),),
                  offset: Offset(animation!.value, 20),
                ),
                Container(width: 100, height: 300, color: Colors.transparent),
                Container(width: 100, height: 100, color: Colors.transparent),]
          );
        },
      ),
    );
  }



}