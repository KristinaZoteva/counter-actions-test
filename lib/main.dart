import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showSheet(context);
          },
          child: const Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}

void showSheet(BuildContext context) {
  showFlexibleBottomSheet(
    context: context,
    maxHeight: 1,
    initHeight: 1,
    isExpand: false,
    builder: (_, scrollController, __) {
      return SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.red,
            ),
          ],
        ),
      );
    },
  );
}
