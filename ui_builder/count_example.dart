import 'dart:async';

import 'package:change_notifier_provider/provider_class/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountExampleClass extends StatefulWidget {
  const CountExampleClass({super.key});

  @override
  State<CountExampleClass> createState() => _CountExampleClassState();
}

class _CountExampleClassState extends State<CountExampleClass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Counting"),
        ),
        body: Center(child: Consumer<CountProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 50),
            );
          },
        )));
  }
}
