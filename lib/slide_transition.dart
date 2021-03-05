import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> slideAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    slideAnimation = Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //appBar:AppBar(.......)
        body: Container(
          padding: const EdgeInsets.all(13.0),
          height: MediaQuery.of(context).size.height, // / 2.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Center(child: Text('Slide Transition Demo')),
          // child:Column(.....)
        ),
      ),
    );
  }
}
