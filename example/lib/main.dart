import 'package:example/web_view_page.dart';
import 'package:fk_webview/fk_webview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'fk_webview',
      ),
    );
  }
}

class BizJavaScriptHandlerInterceptor implements JavaScriptHandlerInterceptor {
  @override
  Future<JavaScriptHandlerResult?> handler(JavaScriptHandler handler, List<dynamic> args) async {
    if (handler.name == 'scanQRCode') {
      return JavaScriptHandlerResult(data: 'ok!');
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              child: Text('打开网页'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return FWebViewPage(
                        showNavBarItem: false,
                        immersive: true,
                        isSafeArea: true,
                        urlBuilder: (_) {
                          return Future.value("https://www.ttv0.com");
                        });
                  },
                ));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
