import 'dart:io';

import 'package:flutter/cupertino.dart';

// 待转运， 转运中，已转运，已暂停
class TransportItem extends StatelessWidget {
  const TransportItem({
    super.key,
    required this.process
  });

  final Process process;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(

      ),
    );
  }
}