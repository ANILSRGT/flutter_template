import 'package:flutter/material.dart';

import 'base_state.dart';
import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.context,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    required this.onDispose,
  }) : super(key: key);

  final BuildContext context;
  final Widget Function(BuildContext context, T value, double banneHeight) onPageBuilder;
  final T viewModel;
  final void Function(T model) onModelReady;
  final VoidCallback? onDispose;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends BaseState<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    widget.onModelReady(viewModel);
    viewModel.setContext(widget.context);
    viewModel.init();
    viewModel.setStateFunc = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.onDispose();
    widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, viewModel, 0);
  }
}
