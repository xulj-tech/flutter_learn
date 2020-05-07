// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_learn/hy/model/login_entity.dart';
import 'package:flutter_learn/generated/json/login_entity_helper.dart';
import 'package:flutter_learn/hy/model/relation_entity.dart';
import 'package:flutter_learn/generated/json/relation_entity_helper.dart';
import 'package:flutter_learn/hy/model/server_set_entity.dart';
import 'package:flutter_learn/generated/json/server_set_entity_helper.dart';
import 'package:flutter_learn/model/home_entity.dart';
import 'package:flutter_learn/generated/json/home_entity_helper.dart';
import 'package:flutter_learn/model/banner_entity.dart';
import 'package:flutter_learn/generated/json/banner_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case LoginEntity:
			return loginEntityFromJson(data as LoginEntity, json) as T;			case LoginData:
			return loginDataFromJson(data as LoginData, json) as T;			case LoginDataAC:
			return loginDataACFromJson(data as LoginDataAC, json) as T;			case LoginDataACsV:
			return loginDataACsVFromJson(data as LoginDataACsV, json) as T;			case RelationEntity:
			return relationEntityFromJson(data as RelationEntity, json) as T;			case RelationData:
			return relationDataFromJson(data as RelationData, json) as T;			case RelationDataAC:
			return relationDataACFromJson(data as RelationDataAC, json) as T;			case RelationDataACsV:
			return relationDataACsVFromJson(data as RelationDataACsV, json) as T;			case ServerSetEntity:
			return serverSetEntityFromJson(data as ServerSetEntity, json) as T;			case ServerSetData:
			return serverSetDataFromJson(data as ServerSetData, json) as T;			case ServerSetDataAC:
			return serverSetDataACFromJson(data as ServerSetDataAC, json) as T;			case ServerSetDataACsV:
			return serverSetDataACsVFromJson(data as ServerSetDataACsV, json) as T;			case HomeEntity:
			return homeEntityFromJson(data as HomeEntity, json) as T;			case HomeData:
			return homeDataFromJson(data as HomeData, json) as T;			case HomeDataData:
			return homeDataDataFromJson(data as HomeDataData, json) as T;			case BannerEntity:
			return bannerEntityFromJson(data as BannerEntity, json) as T;			case BannerData:
			return bannerDataFromJson(data as BannerData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case LoginEntity:
			return loginEntityToJson(data as LoginEntity);			case LoginData:
			return loginDataToJson(data as LoginData);			case LoginDataAC:
			return loginDataACToJson(data as LoginDataAC);			case LoginDataACsV:
			return loginDataACsVToJson(data as LoginDataACsV);			case RelationEntity:
			return relationEntityToJson(data as RelationEntity);			case RelationData:
			return relationDataToJson(data as RelationData);			case RelationDataAC:
			return relationDataACToJson(data as RelationDataAC);			case RelationDataACsV:
			return relationDataACsVToJson(data as RelationDataACsV);			case ServerSetEntity:
			return serverSetEntityToJson(data as ServerSetEntity);			case ServerSetData:
			return serverSetDataToJson(data as ServerSetData);			case ServerSetDataAC:
			return serverSetDataACToJson(data as ServerSetDataAC);			case ServerSetDataACsV:
			return serverSetDataACsVToJson(data as ServerSetDataACsV);			case HomeEntity:
			return homeEntityToJson(data as HomeEntity);			case HomeData:
			return homeDataToJson(data as HomeData);			case HomeDataData:
			return homeDataDataToJson(data as HomeDataData);			case BannerEntity:
			return bannerEntityToJson(data as BannerEntity);			case BannerData:
			return bannerDataToJson(data as BannerData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'LoginEntity':
			return LoginEntity().fromJson(json);			case 'LoginData':
			return LoginData().fromJson(json);			case 'LoginDataAC':
			return LoginDataAC().fromJson(json);			case 'LoginDataACsV':
			return LoginDataACsV().fromJson(json);			case 'RelationEntity':
			return RelationEntity().fromJson(json);			case 'RelationData':
			return RelationData().fromJson(json);			case 'RelationDataAC':
			return RelationDataAC().fromJson(json);			case 'RelationDataACsV':
			return RelationDataACsV().fromJson(json);			case 'ServerSetEntity':
			return ServerSetEntity().fromJson(json);			case 'ServerSetData':
			return ServerSetData().fromJson(json);			case 'ServerSetDataAC':
			return ServerSetDataAC().fromJson(json);			case 'ServerSetDataACsV':
			return ServerSetDataACsV().fromJson(json);			case 'HomeEntity':
			return HomeEntity().fromJson(json);			case 'HomeData':
			return HomeData().fromJson(json);			case 'HomeDataData':
			return HomeDataData().fromJson(json);			case 'BannerEntity':
			return BannerEntity().fromJson(json);			case 'BannerData':
			return BannerData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'LoginEntity':
			return List<LoginEntity>();			case 'LoginData':
			return List<LoginData>();			case 'LoginDataAC':
			return List<LoginDataAC>();			case 'LoginDataACsV':
			return List<LoginDataACsV>();			case 'RelationEntity':
			return List<RelationEntity>();			case 'RelationData':
			return List<RelationData>();			case 'RelationDataAC':
			return List<RelationDataAC>();			case 'RelationDataACsV':
			return List<RelationDataACsV>();			case 'ServerSetEntity':
			return List<ServerSetEntity>();			case 'ServerSetData':
			return List<ServerSetData>();			case 'ServerSetDataAC':
			return List<ServerSetDataAC>();			case 'ServerSetDataACsV':
			return List<ServerSetDataACsV>();			case 'HomeEntity':
			return List<HomeEntity>();			case 'HomeData':
			return List<HomeData>();			case 'HomeDataData':
			return List<HomeDataData>();			case 'BannerEntity':
			return List<BannerEntity>();			case 'BannerData':
			return List<BannerData>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}