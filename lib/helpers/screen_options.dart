import 'dart:math';

/// Класс для расчета изменения размеров для реализации адаптивности элементов
class ScreenOptions {
  double currentWidth = 375;
  double currentHeight = 812;
  final double defaultWidth = 375;
  final double defaultHeight = 812;

  static final ScreenOptions _instance = ScreenOptions._internal();

  ScreenOptions._internal();

  factory ScreenOptions(double currentWidth, double currentHeight) {
    _instance.currentWidth = currentWidth;
    _instance.currentHeight = currentHeight;
    return _instance;
  }

  static final double _scaleWidth = ScreenOptions._instance.currentWidth /
      ScreenOptions._instance.defaultWidth;
  static final double _scaleHeight = ScreenOptions._instance.currentHeight /
      ScreenOptions._instance.defaultHeight;

  /// расчитывает число относительно изменений ширины экрана
  static w(double width) {
    return ScreenOptions._instance.defaultWidth <
            ScreenOptions._instance.currentWidth
        ? ScreenOptions._instance.currentWidth *
            (width / ScreenOptions._instance.defaultWidth)
        : width;
  }

  /// расчитывает число относительно изменений высоты экрана
  static h(double height) {
    return ScreenOptions._instance.defaultHeight <
            ScreenOptions._instance.currentHeight
        ? ScreenOptions._instance.currentHeight *
            (height / ScreenOptions._instance.defaultHeight)
        : height;
  }

  /// расчитывает радиус относительно изменений ширины или высоты экрана
  static r(double radius) {
    return ScreenOptions._instance.defaultHeight <
                ScreenOptions._instance.currentHeight ||
            ScreenOptions._instance.defaultWidth <
                ScreenOptions._instance.currentWidth
        ? radius * min(_scaleWidth, _scaleHeight)
        : radius;
  }

  /// расчитывает размер текста относительно изменений ширины экрана
  static sp(double fontSize) {
    return ScreenOptions._instance.defaultWidth <
            ScreenOptions._instance.currentWidth
        ? fontSize * _scaleWidth
        : fontSize;
  }
}
