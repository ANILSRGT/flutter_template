import 'package:flutter/material.dart';

class ResponsiveWidget extends StatefulWidget {
  final Widget normal;
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  const ResponsiveWidget({
    super.key,
    required this.normal,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (constraints.maxWidth >= 640 && constraints.maxWidth < 768 && widget.xs != null) {
          return widget.xs!;
        } else if (constraints.maxWidth >= 768 &&
            constraints.maxWidth < 1024 &&
            widget.sm != null) {
          return widget.sm!;
        } else if (constraints.maxWidth >= 1024 &&
            constraints.maxWidth < 1280 &&
            widget.md != null) {
          return widget.md!;
        } else if (constraints.maxWidth >= 1280 &&
            constraints.maxWidth < 1536 &&
            widget.lg != null) {
          return widget.lg!;
        } else if (constraints.maxWidth >= 1536 && widget.xl != null) {
          return widget.xl!;
        } else {
          return widget.normal;
        }
      },
    );
  }
}
