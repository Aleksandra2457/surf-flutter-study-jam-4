
import 'dart:math';

class ScreenOptions {
  final double currentWidth;
  final double currentHeight;
  final double defaultWidth = 375;
  final double defaultHeight = 812;

  ScreenOptions({required this.currentHeight, required this.currentWidth});

  static ScreenOptions? _instance;

  static final double _scaleWidth = ScreenOptions._instance!.currentWidth /
      ScreenOptions._instance!.defaultWidth;
  static final double _scaleHeight = ScreenOptions._instance!.currentHeight /
      ScreenOptions._instance!.defaultHeight;

  static ScreenOptions? getInstance(
      {currentWidth, currentHeight, devicePixelRatio}) {
    if (_instance == null) {
      _instance = ScreenOptions(
          currentHeight: currentHeight, currentWidth: currentWidth);
      return _instance;
    }
    return _instance;
  }

  /// расчитывает число относительно изменений ширины экрана
  static w(double width) {
    return ScreenOptions._instance!.defaultWidth <
        ScreenOptions._instance!.currentWidth
        ? ScreenOptions._instance!.currentWidth *
        (width / ScreenOptions._instance!.defaultWidth)
        : width;
  }

  /// расчитывает число относительно изменений высоты экрана
  static h(double height) {
    return ScreenOptions._instance!.defaultHeight <
        ScreenOptions._instance!.currentHeight
        ? ScreenOptions._instance!.currentHeight *
        (height / ScreenOptions._instance!.defaultHeight)
        : height;
  }

  /// расчитывает радиус относительно изменений ширины или высоты экрана
  static r(double radius) {
    return ScreenOptions._instance!.defaultHeight <
        ScreenOptions._instance!.currentHeight ||
        ScreenOptions._instance!.defaultWidth <
            ScreenOptions._instance!.currentWidth
        ? radius * min(_scaleWidth, _scaleHeight)
        : radius;
  }

  /// расчитывает размер текста относительно изменений ширины экрана
  static sp(double fontSize) {
    return ScreenOptions._instance!.defaultWidth <
        ScreenOptions._instance!.currentWidth
        ? fontSize * _scaleWidth
        : fontSize;
  }

  // static ss(double sideOfSquare) {
  //   return ScreenOptions._instance!.defaultHeight <
  //       ScreenOptions._instance!.currentHeight ||
  //       ScreenOptions._instance!.defaultWidth <
  //           ScreenOptions._instance!.currentWidth
  //       ? sideOfSquare * _scaleHeight
  //       : sideOfSquare;
  // }
}