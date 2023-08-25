import 'package:flutter/material.dart';
import 'dart:math';

import 'package:web_smooth_scroll/web_smooth_scroll.dart';

final randomGen = Random();
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  ValueNotifier<int> notifier = ValueNotifier(0);
  int a = 0;
  bool firstEvent = true;
  double ratio = 0;
  Color GetDeathColor() {
    if (randomGen.nextInt(25) == 0) {
      return Colors.red;
    } else
      return Colors.black;
  }
  Color GetForgottenDeathColor() {
    if (randomGen.nextInt(25) == 0) {
      if (randomGen.nextInt(60) < 28){
      return Colors.red;
      } else{
        return Colors.blue;
      }
    } else
      return Colors.black;
  }
  Color GetEarlyDeathColor() {
    if (randomGen.nextInt(2) == 0) {
      
      return Colors.red;
      
    } else
      return Colors.black;
  }
  Color GetSAColor() {
    if (randomGen.nextInt(5) == 0) {
      return Colors.pink;
    }else{
      return Colors.black;
    }
  }

  void _onScrollEvent() {
    final extentBefore = controller.position.extentBefore;
    final extentAfter = controller.position.extentAfter;
    if (!firstEvent) {
      notifier.value = (extentBefore / ratio).round();
      if (extentAfter == 0) {
        notifier.value = 150000;
      }
      if (notifier.value > 150000) {
        notifier.value = 150000;
        firstEvent = true;
      }
    } else {
      ratio = extentAfter / 150000;
      firstEvent = false;
    }
    print("Extent before: $extentBefore");
  }

  @override
  void initState() {
    controller.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onScrollEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width / 80;
    double width = height * .5;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: ValueListenableBuilder(
              valueListenable: notifier,
              builder: (BuildContext context, int val, Widget? child) {
                return Text(
                  "$val Children",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height * 2, fontWeight: FontWeight.bold),
                );
              }),
        ),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: 3001,
        itemBuilder: (BuildContext context, index) {
          if (index == 0) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Every icon represents a child who was forced to endure residential schools.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
          } else if (index == 50) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Watch the number at the top count upwards as the children scroll by.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
          } else if (index == 100) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Over 150,000 children are thought to have attended.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
             } else if (index == 250){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "In contrast the death rate of Canadian WW2 Soldiers was 1/26.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 350){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "The Icons shown in blue are children who died and have had their names forgotten.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 550){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "This is what the death rate looked like in the year 1900",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 650){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Overall 6000 children are believed to have died,\n however, the true number we may never know.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 700){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "The Children coloured pink represent reported victims of sexual assault\n1/5",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 900){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Now with all of these numbers, it can be easy to forget...",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 925){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "That every number represents an individual.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 1500){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Halfway There...",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
            } else if (index == 930){
            return Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                );
          } else if (index < 200) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
              ],
            );
          } else if (index == 200) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Colors.deepOrange,
              elevation: 5,
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "For every child that went to a residential school, 1/25 died\nThe red icons represent children who died in the residential school",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: height),
                ),
              ),
            );
          } else if (index < 350) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
                Child(height: height, width: width, color: GetDeathColor()),
              ],
            );
            } else if (index < 550) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
                Child(height: height, width: width, color: GetForgottenDeathColor()),
              ],
            );
            } else if (index < 700) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
                Child(height: height, width: width, color: GetEarlyDeathColor()),
              ],
            );
            } else if (index < 900){return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
                Child(height: height, width: width, color: GetSAColor()),
              ],
              
            );
            } else if (index < 950) {return SizedBox(height: height,);
            } else if (index < 5000) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                Child(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
              ],
            );
            }
        },
      ),
    );
  }
}

class Child extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  Child({
    super.key,
    required this.height,
    required this.width,
    required this.color,
  });

  final double left = randomGen.nextDouble() * 10;
  final double right = randomGen.nextDouble() * 10;
  final double top = randomGen.nextDouble() * 10;
  final double bottom = randomGen.nextDouble() * 10;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: SizedBox(
        height: height,
        width: width,
        child: Icon(
          Icons.man,
          color: color,
          size: height,
        ),
      ),
    );
  }
}
