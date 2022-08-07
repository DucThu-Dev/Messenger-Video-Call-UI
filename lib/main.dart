import 'package:flutter/material.dart';

import 'package:flutter_messenger_video_call_ui/calling_video/calling_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger Video Call',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.winudf.com/v2/image/Y29tLmJhbGVmb290Lk1vbmtleURMdWZmeVdhbGxwYXBlcl9zY3JlZW5fMF8xNTI0NTE5MTEwXzAyOA/screen-0.jpg?fakeurl=1&type=.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Let \'s join the call',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CallingPage();
                }));
              },
              child: const Text('GO'),
            ),
          ],
        ),
      ),
    );
  }
}
