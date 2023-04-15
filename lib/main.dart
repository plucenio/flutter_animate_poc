import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.purple,
      body: Stack(
        children: [
          _ball(
            context: context,
            color: Colors.amber,
          ),
          _ball(
            context: context,
            color: Colors.red,
          ),
          _ball(
            context: context,
            color: Colors.lightGreen,
          ),
          _ball(
            context: context,
            color: Colors.teal,
          ),
          _ball(
            context: context,
            color: Colors.yellow,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 130,
                ),
                const Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ball({required BuildContext context, required Color color}) {
    final size = MediaQuery.of(context).size;
    double ballSize = 200;
    return Container(
      width: ballSize,
      height: ballSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    )
        .animate(
          onComplete: (controller) => controller.repeat(
            reverse: true,
          ),
        )
        .moveX(
          begin: Random().nextInt((size.width - ballSize).toInt()).toDouble(),
          end: Random().nextInt((size.width - ballSize).toInt()).toDouble(),
          duration: const Duration(seconds: 5),
        )
        .moveY(
          begin: Random().nextInt((size.height - ballSize).toInt()).toDouble(),
          end: Random().nextInt((size.height - ballSize).toInt()).toDouble(),
          duration: const Duration(seconds: 5),
        )
        .color()
        .blurXY(
          begin: 80,
          end: 90,
        );
  }
}
