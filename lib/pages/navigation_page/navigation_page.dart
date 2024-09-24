import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget{
  const NavigationPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(

        ),
        child: const Column(
            children: [
              NavigationOfPack(),
              SizedBox(height: 20,),
              NavigationOfEs()
            ],
        ),
      ),
    );
  }
}

class NavigationOfPack extends StatelessWidget {
  const NavigationOfPack({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Pack');
  }
}

class NavigationOfEs extends StatelessWidget {
  const NavigationOfEs({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('es Transport');
  }
}

class NavigationOfTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}