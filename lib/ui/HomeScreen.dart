import 'package:flutter/material.dart';

/// 
/// project: flutter_bloc_tutorial
/// @package: ui
/// @author dammyololade
/// created on 30/05/2020
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: Center(child: Text("Center stuff"),),
    );
  }

}