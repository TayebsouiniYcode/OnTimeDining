import 'package:flutter/material.dart';
import 'package:on_time_dining/model/Dash.dart';

class DashDetails extends StatefulWidget {
  final Dash dash;
  const DashDetails({super.key, required this.dash});

  @override
  State<DashDetails> createState() => _DashDetailsState();
}

class _DashDetailsState extends State<DashDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Dash title : ${widget.dash.title}")),
    );
  }
}
