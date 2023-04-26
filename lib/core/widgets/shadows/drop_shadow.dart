import 'package:flutter/material.dart';

class DropShadow extends StatelessWidget {
  const DropShadow({
    Key? key,
    required this.child,
    this.color = Colors.black,
    this.offset = const Offset(0, 5),
    this.opacity = 0.65,
    this.blurRadius = 4,
    this.width,
    this.height,
    this.constraints,
    this.decoration,
    this.padding,
    this.margin,
  }) : super(key: key);

  final Color color;
  final Offset offset;
  final double blurRadius;
  final double opacity;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      constraints: constraints,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: decoration?.copyWith(
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(opacity),
            offset: offset,
            blurRadius: blurRadius,
          ),
        ],
      ),
      child: child,
    );
  }
}
