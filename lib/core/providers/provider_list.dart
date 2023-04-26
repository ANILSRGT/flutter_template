import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'theme_notifier.dart';

class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()..init()),
  ];
}
