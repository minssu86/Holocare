import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget top;
  final Widget middle;
  final Widget bottom;
  const LayoutWidget({
    super.key,
    required this.appBar,
    required this.top,
    required this.middle,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        top: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: top,
              ),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [middle, bottom],
                ),
              ),
              // Expanded(
              //   flex: 2,
              //   child: bottom,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
