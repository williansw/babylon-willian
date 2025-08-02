import 'package:flutter/material.dart';
import '../../core/style/styte.dart';

/// Adds vertical and horizontal spacing using a number.
/// Example: 16.spaceV => SizedBox(height: 16)
extension SpaceExtension on num {
  Widget get spaceV => SizedBox(height: toDouble());
  Widget get spaceH => SizedBox(width: toDouble());
}

/// Adds padding easily to any Widget.
extension PaddingExtension on Widget {
  Widget padAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget padSymmetric({double vertical = 0, double horizontal = 0}) => Padding(
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child: this,
  );

  Widget padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );
}

/// Quickly centers a widget using Center.
extension CenterExtension on Widget {
  Widget get centered => Center(child: this);
}

/// Controls visibility without affecting layout.
extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}

/// Easily expand a widget in Row or Column.
extension FlexExtension on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);
}

/// Wraps a widget with GestureDetector to handle tap.
extension GestureExtension on Widget {
  Widget onTap(
    VoidCallback onTap, {
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) => GestureDetector(onTap: onTap, behavior: behavior, child: this);
}

/// Wraps a widget with SafeArea.
extension SafeAreaExtension on Widget {
  Widget get safe => SafeArea(child: this);
}

/// Wraps a widget inside a container with optional configuration.
extension ContainerExtension on Widget {
  Widget withContainer({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) => Container(
    key: key,
    alignment: alignment,
    padding: padding,
    color: color,
    decoration: decoration,
    width: width,
    height: height,
    constraints: constraints,
    margin: margin,
    transform: transform,
    transformAlignment: transformAlignment,
    clipBehavior: clipBehavior,
    child: this,
  );

  Widget withRoundedBorder({
    Color color = AppColor.primary,
    double width = 1.0,
    double radius = AppRadius.small,
    BorderStyle style = BorderStyle.solid,
  }) => withContainer(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: width, style: style),
      borderRadius: BorderRadius.circular(radius),
    ),
  );

  Widget withBorder({
    Color color = AppColor.primary,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double? radius,
  }) => withContainer(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: width, style: style),
      borderRadius: radius != null ? BorderRadius.circular(radius) : null,
    ),
  );

  Widget withShadow({
    Color color = Colors.black54,
    double blurRadius = Spacing.x1,
    double spreadRadius = Spacing.half,
    Offset offset = const Offset(0, 2),
    double? radius,
  }) => withContainer(
    decoration: BoxDecoration(
      borderRadius: radius != null ? BorderRadius.circular(radius) : null,
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    ),
  );

  Widget withGradient({
    required List<Color> colors,
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter,
    double? radius,
  }) => withContainer(
    decoration: BoxDecoration(
      borderRadius: radius != null ? BorderRadius.circular(radius) : null,
      gradient: LinearGradient(colors: colors, begin: begin, end: end),
    ),
  );
}

/// Enables vertical scrolling on a widget.
extension ScrollExtension on Widget {
  Widget get scroll => SingleChildScrollView(child: this);
}

/// Applies opacity to a widget.
extension OpacityExtension on Widget {
  Widget opacity(double value) => Opacity(opacity: value, child: this);
}

/// Aligns a widget using Align.
extension AlignExtension on Widget {
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);
}

/// Adds Dismissible behavior for lists.
extension DismissibleExtension on Widget {
  Widget dismissible({
    required Key key,
    required DismissDirection direction,
    required void Function(DismissDirection) onDismissed,
    Widget? background,
    Widget? secondaryBackground,
  }) => Dismissible(
    key: key,
    direction: direction,
    onDismissed: onDismissed,
    background: background,
    secondaryBackground: secondaryBackground,
    child: this,
  );
}

/// Adds tooltip to any widget.
extension TooltipExtension on Widget {
  Widget tooltip(String message) => Tooltip(message: message, child: this);
}

/// Adds Hero animation easily.
extension HeroExtension on Widget {
  Widget hero(String tag) => Hero(tag: tag, child: this);
}

/// Adds clipping with rounded corners or oval.
extension ClipExtension on Widget {
  Widget clipRRect([double radius = AppRadius.small]) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  Widget get clipOval => ClipOval(child: this);
}

/// Adds AnimatedSwitcher wrapper.
extension AnimatedSwitcherExtension on Widget {
  Widget animatedSwitcher({
    Duration duration = const Duration(milliseconds: 300),
  }) => AnimatedSwitcher(duration: duration, child: this);
}

/// Adds width and/or height using SizedBox.
extension SizeExtension on Widget {
  Widget sized({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);
}

/// Extensions for List of Widgets.
extension WidgetListExtension on List<Widget> {
  List<Widget> separated(double space) => [
    for (int i = 0; i < length; i++) ...[
      this[i],
      if (i != length - 1) SizedBox(height: space),
    ],
  ];

  Widget column({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) => Column(
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    children: this,
  );

  Widget row({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) => Row(
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    children: this,
  );
}

/// Extensions for BoxDecoration.
extension BoxDecorationExtension on BoxDecoration {
  BoxDecoration withBorderRadius(double radius) =>
      copyWith(borderRadius: BorderRadius.circular(radius));

  BoxDecoration withBorder({
    Color color = Colors.black,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) => copyWith(
    border: Border.all(color: color, width: width, style: style),
  );

  BoxDecoration withShadow({
    Color color = Colors.black,
    double blurRadius = Spacing.x1,
    double spreadRadius = Spacing.half,
    Offset offset = const Offset(0, 2),
  }) => copyWith(
    boxShadow: [
      BoxShadow(
        color: color,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      ),
    ],
  );

  BoxDecoration withColor(Color color) => copyWith(color: color);
}
