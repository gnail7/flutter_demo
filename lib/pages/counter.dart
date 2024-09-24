import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_mes/pages/color_counter.dart';

class Counter extends StatefulWidget {
  _Counter createState() => _Counter();
}

class _Counter extends State {
  int num = 0;
  Color color = Colors.blue;


  void updateNum() {
    setState(() {
      num++;
    });
  }
  
  void changeCount(int val) {
    setState(() {
      num = num + val;
    });
  }
  
  void changeColor(Color val) {
    setState(() {
      color = val;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: ColorCounter(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () => changeCount(-1), icon: Icon(Icons.delete)),
                  CounterBorder(),
                  IconButton(onPressed: () => changeCount(1), icon: Icon(Icons.add)),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed:() => changeColor(Colors.blue) , icon: Icon(Icons.circle), color: Colors.blue,),
                  IconButton(onPressed:() => changeColor(Colors.red) , icon: Icon(Icons.circle), color: Colors.red,),
                  IconButton(onPressed:() => changeColor(Colors.grey) , icon: Icon(Icons.circle), color: Colors.grey,),
                  IconButton(onPressed:() => changeColor(Colors.green) , icon: Icon(Icons.circle), color: Colors.green,),
                  IconButton(onPressed:() => changeColor(Colors.pink) , icon: Icon(Icons.circle), color: Colors.pink,),
                  IconButton(onPressed:() => changeColor(Colors.orange) , icon: Icon(Icons.circle), color: Colors.orange,),
                ],
              )
            ],
          ), 
          color: color, count: num,),
      ),
    );
  }
}

class CounterBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color? c = ColorCounter.of(context)?.color;
    final int count = ColorCounter.of(context)?.count??0;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: c!, // 边框颜色
          width: 4, // 边框宽度
        ),
      ),
      child: Text('count:  $count'),
    );
  }
}