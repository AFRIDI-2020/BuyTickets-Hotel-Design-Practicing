import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildSwitch extends StatelessWidget {
  const BuildSwitch({super.key, required this.switchValue, required this.switchFunction});

  final bool switchValue;
  final Function(bool _) switchFunction;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: Colors.red,
      value: switchValue,
      onChanged: switchFunction,
    );
  }
}
