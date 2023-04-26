part of 'all_extensions.dart';

extension BoxConstraintsExtension on BoxConstraints {
  double dynamicHeight(double value) => maxHeight * value;
  double dynamicWidth(double value) => maxWidth * value;

  double dynamicResponsiveSize(double value) =>
      dynamicOrientation(dynamicHeight(value), dynamicWidth(value));
  double dynamicOrientationWidth(double portraitValue, double landscapeValue) =>
      dynamicOrientation(dynamicWidth(portraitValue), dynamicWidth(landscapeValue));
  double dynamicOrientationHeight(double portraitValue, double landscapeValue) =>
      dynamicOrientation(dynamicHeight(portraitValue), dynamicHeight(landscapeValue));

  double staticOrientationWidth(double portraitValue, double landscapeValue) =>
      dynamicOrientation(portraitValue, landscapeValue);
  double staticOrientationHeight(double portraitValue, double landscapeValue) =>
      dynamicOrientation(portraitValue, landscapeValue);

  double dynamicResponsiveSizeForContext(BuildContext context, double value) =>
      dynamicOrientationForContext(context, dynamicHeight(value), dynamicWidth(value));
  double dynamicOrientationWidthForContext(
          BuildContext context, double portraitValue, double landscapeValue) =>
      dynamicOrientationForContext(
          context, dynamicWidth(portraitValue), dynamicWidth(landscapeValue));
  double dynamicOrientationHeightForContext(
          BuildContext context, double portraitValue, double landscapeValue) =>
      dynamicOrientationForContext(
          context, dynamicHeight(portraitValue), dynamicHeight(landscapeValue));

  double staticOrientationWidthForContext(
          BuildContext context, double portraitValue, double landscapeValue) =>
      dynamicOrientationForContext(context, portraitValue, landscapeValue);
  double staticOrientationHeightForContext(
          BuildContext context, double portraitValue, double landscapeValue) =>
      dynamicOrientationForContext(context, portraitValue, landscapeValue);

  double dynamicOrientation(double forPortrait, double forLandscape) =>
      maxWidth > maxHeight ? forLandscape : forPortrait;

  double dynamicOrientationForContext(
          BuildContext context, double forPortrait, double forLandscape) =>
      context.width > context.height ? forLandscape : forPortrait;
}
