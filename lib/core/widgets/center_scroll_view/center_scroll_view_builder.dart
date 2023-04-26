import 'package:flutter/material.dart';

import '../../extension/all_extensions.dart';

class CenterScrollViewWidgets {
  final Widget? topWidget;
  final Widget? centerWidget;
  final Widget? bottomWidget;
  const CenterScrollViewWidgets({
    this.topWidget,
    this.centerWidget,
    this.bottomWidget,
  });
}

class CenterScrollViewBuilder extends StatefulWidget {
  final CenterScrollViewWidgets Function(BoxConstraints layoutConstraints) builder;
  final BoxDecoration? decoration;
  const CenterScrollViewBuilder({
    super.key,
    required this.builder,
    this.decoration,
  });

  @override
  State<CenterScrollViewBuilder> createState() => _CenterScrollViewBuilderState();
}

class _CenterScrollViewBuilderState extends State<CenterScrollViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          decoration: widget.decoration,
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(width: context.width),
                      Visibility(
                        visible: widget.builder(constraints).topWidget != null,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: widget.builder(constraints).topWidget,
                        ),
                      ),
                      Visibility(
                        visible: widget.builder(constraints).centerWidget == null,
                        child: const Expanded(
                          child: SizedBox(),
                        ),
                      ),
                      Visibility(
                        visible: widget.builder(constraints).centerWidget != null,
                        child: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: context.width),
                                widget.builder(constraints).centerWidget ?? const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.builder(constraints).bottomWidget != null,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: widget.builder(constraints).bottomWidget,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
