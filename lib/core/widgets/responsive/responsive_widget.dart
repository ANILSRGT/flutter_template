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
        if (constraints.maxWidth >= 640 && constraints.maxWidth < 768) {
          return widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= 768 && constraints.maxWidth < 1024) {
          return widget.sm ?? widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= 1024 && constraints.maxWidth < 1280) {
          return widget.md ?? widget.sm ?? widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= 1280 && constraints.maxWidth < 1536) {
          return widget.lg ?? widget.md ?? widget.sm ?? widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= 1536) {
          return widget.xl ?? widget.lg ?? widget.md ?? widget.sm ?? widget.xs ?? widget.normal;
        } else {
          return widget.normal;
        }
      },
    );
  }
}
