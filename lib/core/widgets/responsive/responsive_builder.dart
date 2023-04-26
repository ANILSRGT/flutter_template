import 'package:flutter/material.dart';

enum ResponsiveType { mobile, tablet, desktop }

class ResponsiveBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, ResponsiveType responsiveType) builder;
  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  State<ResponsiveBuilder> createState() => _ResponsiveBuilderState();
}

class _ResponsiveBuilderState extends State<ResponsiveBuilder> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (constraints.maxWidth < 600) {
          return widget.builder(ctx, ResponsiveType.mobile);
        } else if (constraints.maxWidth < 900) {
          return widget.builder(ctx, ResponsiveType.tablet);
        } else {
          return widget.builder(ctx, ResponsiveType.desktop);
        }
      },
    );
  }
}
