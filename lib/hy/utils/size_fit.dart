import 'dart:ui';

class ScreenUtil {
  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;

  static double rpx;
  static double mPx;

  static void initialize({double standardSize = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    print("宽高==$physicalWidth --- $physicalHeight");

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    mPx = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return mPx * size;
  }

  static px(int size) {
    return mPx * size;
  }
}