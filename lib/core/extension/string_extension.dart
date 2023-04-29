part of 'all_extensions.dart';

extension StringExtension on String {
  String get capatalize => this[0].toUpperCase() + substring(1);
  String get unCapatalize => this[0].toLowerCase() + substring(1);

  String get locale => this.tr();
  String localeWithArgs({List<String>? args, Map<String, String>? namedArgs}) =>
      this.tr(args: args, namedArgs: namedArgs);

  String get toSingleLine => replaceAll("\n", "{/n/}");
  String get toMultiLine => replaceAll("{/n/}", "\n");
  String get toSingleLineWithTrim => trim().toSingleLine;
  String get toMultiLineWithTrim => trim().toMultiLine;

  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}

extension StringImageExtension on String {
  SvgPicture get svgToImage => SvgPicture.asset(this);
  SvgPicture svgToImageBrigthness(BuildContext context, String darkPath) {
    return SvgPicture.asset(
      Theme.of(context).brightness == Brightness.dark ? darkPath : this,
    );
  }

  SvgPicture svgToImageWithColor(Color color) => SvgPicture.asset(
        this,
        color: color,
      );
}

extension StringIconifyExtension on String {
  Widget iconifyToIcon(BuildContext context, {Color? color, double? size}) => Iconify(
        this,
        color: color ?? Theme.of(context).iconTheme.color,
        size: size ?? Theme.of(context).iconTheme.size,
      );

  Widget iconifyToAppBarIcon(BuildContext context, {Color? color, double? size}) => Iconify(
        this,
        color: color ?? Theme.of(context).appBarTheme.iconTheme?.color,
        size: size ?? Theme.of(context).appBarTheme.iconTheme?.size,
      );

  Widget iconifyToFloatingActionIcon(BuildContext context, {Color? color, double? size}) => Iconify(
        this,
        color: color ?? Theme.of(context).floatingActionButtonTheme.foregroundColor,
        size: size ?? Theme.of(context).floatingActionButtonTheme.iconSize,
      );
}
