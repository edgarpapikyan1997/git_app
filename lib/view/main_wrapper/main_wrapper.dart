import 'package:flutter/material.dart';
import 'package:git_app/main.dart';
import 'package:git_app/utils/extensions/widget_extension.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.blue,
      ),
    ).paddingOnly(top: 53);
  }
}
