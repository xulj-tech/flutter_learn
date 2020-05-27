import 'package:flutter_learn/hy/utils/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  final List<String> bannerList;

  BannerWidget({Key key, this.bannerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.px(750),
      height: ScreenUtil.px(240),
      child: Swiper(
        scrollDirection: Axis.horizontal,
        // 横向
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                //轮播图点击跳转详情页
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("${bannerList[index]}"),
                  fit: BoxFit.fill,
                )),
              ));
        },
        itemCount: bannerList.length,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.white.withOpacity(0.5),
            activeColor: Colors.white,
          ),
          margin: EdgeInsets.all(10),
        ),

        autoplay: true,
        loop: false,
      ),
    );
  }
}
