import 'package:flutter/material.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Row(children: [
              Column(children: [
                // Icon(Icons.volume_up),
						    FlutterVolumeSlider(
                  display: Display.VERTICAL,
                  sliderActiveColor: Colors.blue,
                  sliderInActiveColor: Colors.grey,
                ),
							])
						]),
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
