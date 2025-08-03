class AppImage {
  AppImage._();

  static String get _pngFolder => 'assets/png/';

  static String _withPngExtension(String imageName, String extension) =>
      '$_pngFolder$imageName.$extension';

  static String _defaultPngPath(String imageName) =>
      _withPngExtension(imageName, 'png');

  //PNG ICONS
  static final babylonIcon = _defaultPngPath('babylon_icon');
}
