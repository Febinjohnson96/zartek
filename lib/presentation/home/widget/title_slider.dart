import 'package:flutter/material.dart';

class TitleSlider extends StatelessWidget {
  const TitleSlider({
    super.key,
    required this.isselected,
    required this.title,
  });

  final bool isselected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isselected ? Colors.red : Colors.black,
                fontSize: 20,
              ),
            ),
            Container(
              width: 100,
              height: 10,
              color: isselected ? Colors.red : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
