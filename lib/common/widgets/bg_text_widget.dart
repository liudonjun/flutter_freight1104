import 'package:flutter/material.dart';
import 'package:flutter_freight/common/values/images.dart';

/// 带背景图片的文字组件
class BgTextWidget extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const BgTextWidget({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 44,
      height: height ?? 14,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.bgKuanPng),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
