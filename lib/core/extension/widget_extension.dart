part of 'all_extensions.dart';

extension WidgetExtension on Widget {
  SliverToBoxAdapter get toSliverToBoxAdapter => SliverToBoxAdapter(child: this);
}
