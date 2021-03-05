import 'package:backdrop/backdrop.dart';
import 'package:backdrop_demo/slide_transition.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Widget1(),
    Widget2(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Demo',
      home: BackdropScaffold(
        headerHeight: 0,
        animationCurve: Curves.easeInOut,
        //backLayerBackgroundColor: Color(0xffF0F3F7), // color del que se abre
        //frontLayerBackgroundColor: Colors.red, //color del body
        //frontLayerScrim: Colors.red, color del body minimizado abajo
        frontLayerBorderRadius: BorderRadius.circular(0),
        // = const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        appBar: BackdropAppBar(
          title: Text("Backdrop Example"),
          /* actions: <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            )
          ], */
        ),
        // stickyFrontLayer: true,
        frontLayer: _pages[_currentIndex],
        backLayer: BackdropNavigationBackLayer(
          items: [
            ListTile(title: Text("Widget 1")),
            ListTile(title: Text("Widget 2")),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {
                showDialog(context: context, child: FiltersPage());
              },
            ),
          ],
          onTap: (int position) => {
            setState(() => _currentIndex = position),
          },
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Widget 1"),
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Widget 2"),
      ),
    );
  }
}
