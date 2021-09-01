import 'package:flutter/material.dart';
import 'package:http_request/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: avoid_init_to_null
  PostResult? postResult = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('HTTP Request'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ignore: unnecessary_null_comparison
              Text((postResult != null)
                  ? postResult!.id + ' | ' + postResult!.name
                  : 'Tidak ada data'),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectAPI('69', 'badut').then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text('Post'),
              )
            ]),
      ),
    ));
  }
}
