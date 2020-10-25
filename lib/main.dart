import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hearingaid',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'hearingaid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _currentSliderValue = 20;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _lowerValue = 0, _upperValue = 100;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.volume_up)),
              Tab(icon: Icon(Icons.equalizer)),
              Tab(icon: Icon(Icons.bluetooth)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          title: Text('hearingaid'),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 50, right: 50),
              /* alignment: Alignment.centerLeft, */
              child: FlutterSlider(
                values: [100],
                max: 100,
                min: 1,
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  _lowerValue = lowerValue;
                  _upperValue = upperValue;
                  setState(() {});
                },
                axis: Axis.vertical,
                handler: FlutterSliderHandler(
                  decoration: BoxDecoration(),
                  child: Material(
                    type: MaterialType.canvas,
                    color: Colors.blue,
                    elevation: 10,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.adjust,
                          size: 25,
                        ),
                      ),
                  ),
                ),
                /* tooltip: FlutterSliderTooltip( */
                /*   disabled: true, */
                /* ), */
                /* rightHandler: FlutterSliderHandler( */
                /*   child: Icon( */
                /*     Icons.chevron_left, */
                /*     color: Colors.red, */
                /*     size: 24, */
                /*   ), */
                /* ), */
                trackBar: FlutterSliderTrackBar(
                  inactiveTrackBar: BoxDecoration(
                    /* borderRadius: BorderRadius.circular(20), */
                    color: ThemeData.dark().accentColor,
                  ),
                  activeTrackBar: BoxDecoration(
                    /* color: ThemeData.dark().textTheme.caption.color, */
                    color: ThemeData.dark().primaryColor,
                  ),
                ),
              ),
            ),
            Icon(Icons.equalizer),
            Row(children: [
              Column(children: [
                Icon(Icons.bluetooth),
                Icon(Icons.bluetooth_disabled),
                Icon(Icons.bluetooth_connected),
                Icon(Icons.bluetooth_searching),
              ]),
            ]),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
