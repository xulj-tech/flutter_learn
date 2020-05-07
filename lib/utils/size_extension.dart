import 'size_fit.dart';

extension DoubleFit on double {
  double get px {
    return ScreenUtil.setPx(this);
  }

  double get rpx {
    return ScreenUtil.setRpx(this);
  }
}

extension IntFit on int {
  double get px {
    return ScreenUtil.setPx(this.toDouble());
  }

  double get rpx {
    return ScreenUtil.setRpx(this.toDouble());
  }
}
