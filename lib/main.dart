import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  double _lowerValue = 0;

  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.all(20),
              child: Row(children: [
                /* Text(_lowerValue.toString()), */
                FlutterSlider(
                  /* handlerWidth: 60, */
                  values: [100],
                  max: 100,
                  min: 1,
                  step: FlutterSliderStep(step: 10),
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    setState(() {
                      _lowerValue = 100 - lowerValue;
                    });
                  },
                  axis: Axis.vertical,
                  handler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: Material(
                      type: MaterialType.canvas,
                      color: ThemeData.dark().primaryColor,
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.horizontal_rule,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  tooltip: FlutterSliderTooltip(
                    direction: FlutterSliderTooltipDirection.right,
                    positionOffset:
                        FlutterSliderTooltipPositionOffset(right: -50),
                  ),
                  trackBar: FlutterSliderTrackBar(
                    activeTrackBarHeight: 10,
                    inactiveTrackBarHeight: 10,
                    inactiveTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeData.dark().accentColor,
                    ),
                    activeTrackBar: BoxDecoration(
                      color: ThemeData.dark().primaryColor,
                    ),
                  ),
                  hatchMark: FlutterSliderHatchMark(
                    displayLines: true,
                    labelsDistanceFromTrackBar: -60,
                    labels: [for (var i = 0; i < 11; i += 1) i]
                        .map((n) => FlutterSliderHatchMarkLabel(
                            percent: 100 - 10.0 * n,
                            label: Text('${10.0 * n}%')))
                        .toList(),
                  ),
                ),
              ]),
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
