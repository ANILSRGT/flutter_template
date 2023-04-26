import 'package:flutter/material.dart';

enum ResponsiveSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

class Responsive extends StatelessWidget {
  final Map<ResponsiveSize, int> breakPoints;
  final Widget child;

  static final Map<ResponsiveSize, int> _breakPoints = {
    ResponsiveSize.xs: 640,
    ResponsiveSize.sm: 768,
    ResponsiveSize.md: 1024,
    ResponsiveSize.lg: 1280,
    ResponsiveSize.xl: 1536,
  };

  static int get xsPoint => _breakPoints[ResponsiveSize.xs]!;
  static int get smPoint => _breakPoints[ResponsiveSize.sm]!;
  static int get mdPoint => _breakPoints[ResponsiveSize.md]!;
  static int get lgPoint => _breakPoints[ResponsiveSize.lg]!;
  static int get xlPoint => _breakPoints[ResponsiveSize.xl]!;

  const Responsive({
    Key? key,
    required this.breakPoints,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    breakPoints.forEach((key, value) {
      _breakPoints[key] = value;
    });
    return child;
  }
}

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
        if (constraints.maxWidth >= Responsive.xsPoint &&
            constraints.maxWidth < Responsive.smPoint) {
          return widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= Responsive.smPoint &&
            constraints.maxWidth < Responsive.mdPoint) {
          return widget.sm ?? widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= Responsive.mdPoint &&
            constraints.maxWidth < Responsive.lgPoint) {
          return widget.md ?? widget.sm ?? widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= Responsive.lgPoint &&
            constraints.maxWidth < Responsive.xlPoint) {
          return widget.lg ?? widget.md ?? widget.sm ?? widget.xs ?? widget.normal;
        } else if (constraints.maxWidth >= Responsive.xlPoint) {
          return widget.xl ?? widget.lg ?? widget.md ?? widget.sm ?? widget.xs ?? widget.normal;
        } else {
          return widget.normal;
        }
      },
    );
  }
}
