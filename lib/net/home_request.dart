
import 'package:flutter_learn/generated/json/banner_entity_helper.dart';
import 'package:flutter_learn/generated/json/home_entity_helper.dart';
import 'package:flutter_learn/model/banner_entity.dart';
import 'package:flutter_learn/model/home_entity.dart';
import 'http_request.dart';

class HomeRequest {

  ///  获取banner数据
  ///  https://www.wanandroid.com/banner/json
  static Future<BannerEntity> requestBannerList() async {
    final url = "https://www.wanandroid.com/banner/json";

    var response = await HttpRequest.request(url);
    BannerEntity entity=BannerEntity();
    bannerEntityFromJson(entity, response);
    return entity;
  }

  /// 获取首页列表数据
  /// http://www.wanandroid.com/article/list/0/json
  static Future<HomeEntity> requestHomeList(int start) async {
    final url = "/article/list/$start/json";

    var response = await HttpRequest.request(url);
    HomeEntity homeEntity=HomeEntity();
    homeEntityFromJson(homeEntity, response);
    return homeEntity;
  }
}