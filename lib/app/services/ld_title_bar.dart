import 'package:flutter/material.dart';
import 'package:xiaomi_shop/app/services/screen_adapter.dart';

class LdTitleBar extends StatelessWidget {
  final String leftTitle;
  final Widget right;
  final num width;
  final num height;
  const LdTitleBar(
      {Key? key,
      this.height = 20,
      this.width = 30,
      required this.leftTitle,
      required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenAdapter.height(height),
          horizontal: ScreenAdapter.width(height)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            leftTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenAdapter.fontSize(46),
            ),
          ),
          right
        ],
      ),
    );
  }
}
