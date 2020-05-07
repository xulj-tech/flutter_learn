
import 'package:flutter_learn/generated/json/logout_entity_helper.dart';
import 'package:flutter_learn/generated/json/server_set_entity_helper.dart';
import 'package:flutter_learn/generated/json/login_entity_helper.dart';
import 'package:flutter_learn/generated/json/relation_entity_helper.dart';
import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/model/login_entity.dart';
import 'package:flutter_learn/hy/model/logout_entity.dart';
import 'package:flutter_learn/hy/model/relation_entity.dart';
import 'package:flutter_learn/hy/model/server_set_entity.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'api_request.dart';

class CommonService {

  static final String uuid=Util.getUUID();
  static String destID="";
  static String user="";
  static String token="";

  /// 地址配置
  static Future<ServerSetEntity> serverRequest(String ip, String port,
      {Function(ServerSetEntity t) onSuccess,
      Function(String error) onError}) async {
    ApiRequest.setBaseUrl(ip, port);

    final url = Api.URL_SET_GATEWAY;

    Map<String, dynamic> data = {
      "SrcID": "3b3754f1546d5d4a",
      "DestID": "0",
      "SN": uuid,
      "User": "",
      "FC": Api.FC_XT_GET_OBJ_ID_0001,
      "Ack": "0",
      "Exp": "p1",
      "ACs": {},
      "Dep": "",
      "Ord":""
    };
    var response = await ApiRequest.request(url, method: "POST", data: data);
    ServerSetEntity serverSetEntity = ServerSetEntity();
    serverSetEntityFromJson(serverSetEntity, response);
    if (serverSetEntity.isSuccess) {
      onSuccess(serverSetEntity);
    } else {
      onError(serverSetEntity.exceptionMsg);
    }
    return serverSetEntity;
  }


  /// 登录
  static Future<LoginEntity> loginRequest(String name, String pwd, String _destID,
      {Function(LoginEntity t) onSuccess,
        Function(String error) onError}) async {

    destID=_destID;

    Map<String, dynamic> param = {
      "username": name,
      "password": pwd,
      "client_type": "2",
      "client_describe": 2,
      "auth_type": "2",
      "client_id": "client_hy_phone",
      "client_secret": "123456",
      "login_type": "1",
      "ip":"10.11.6.94",
      "mac": "68:3E:34:F4:73:68",
      "scope": "",
      "grant_type": "password",
    };

    Map<String, dynamic> p1 = {
      "F": "p1",
      "N": "",
      "V": param,
      "Op": 0,
    };

    Map<String, dynamic> data = {
      "SrcID": "3b3754f1546d5d4a",
      "DestID": _destID,
      "SN": uuid,
      "User": "",
      "FC": Api.FC_VF_VEFY_DNLD_0001,
      "Ack": "0",
      "Exp": "p1",
      "Dep": "",
      "Ord":"",
      "ACs": [p1],
    };

    var response = await ApiRequest.request(Api.URL_LOGIN, method: "POST", data: data);
    LoginEntity loginEntity = LoginEntity();
    loginEntityFromJson(loginEntity, response);
    if (loginEntity.isSuccess) {
      token=loginEntity.data.aCs[0].v.accessToken;
      user="${loginEntity.data.aCs[1].v.id};$token";
      print("user---$user");
      onSuccess(loginEntity);
    } else {
      onError(loginEntity.exceptionMsg);
    }
    return loginEntity;
  }


  /// 流向
  static Future<String> getWebUrl(String code,
      {Function(String t) onSuccess,
        Function(String error) onError}) async {

    Map<String, dynamic> p1 = {
      "F": "p1",
      "N": "",
      "V": code,
      "Op": 0,
    };

    Map<String, dynamic> data = {
      "SrcID": "3b3754f1546d5d4a",
      "DestID": destID,
      "SN": uuid,
      "User": user,
      "FC": Api.FC_XT_CLIENT_GET_CONFIG_0001,
      "Ack": "0",
      "Exp": "p1",
      "Dep": "",
      "Ord":"",
      "ACs": [p1],
    };

    var response = await ApiRequest.request(Api.URL_RELATION, method: "POST", data: data);
    RelationEntity relationEntity = RelationEntity();
    relationEntityFromJson(relationEntity, response);
    var webUrl="";
    if (relationEntity.isSuccess) {
      var entity=relationEntity.data.aCs[0].v[0];
      webUrl = "http://${entity.destIp}:${entity.destPort}${entity.destUrl}&pageName=${entity.destProviderFc}&data={}&tokenId=$token";
      //onSuccess(webUrl);
      return webUrl;
    }else {
      onError(relationEntity.exceptionMsg);
    }
    return webUrl;
  }


  static Future<LogoutEntity> logout({Function(LogoutEntity t) onSuccess,
        Function(String error) onError}) async {

    Map<String, dynamic> map = {
      "tokenId": token,
    };

    Map<String, dynamic> p1 = {
      "F": "p1",
      "N": "",
      "V": map,
      "Op": 0,
    };

    Map<String, dynamic> data = {
      "SrcID": "3b3754f1546d5d4a",
      "DestID": destID,
      "SN": uuid,
      "User": user,
      "FC": Api.FC_XT_VEFY_CANCEL_0001,
      "Ack": "0",
      "Exp": "p1",
      "Dep": "",
      "Ord":"",
      "ACs": [p1],
    };

    var response = await ApiRequest.request(Api.URL_LOGOUT, method: "POST", data: data);
    LogoutEntity logoutEntity = LogoutEntity();
    logoutEntityFromJson(logoutEntity, response);
    if (logoutEntity.isSuccess) {
      onSuccess(logoutEntity);
    }else {
      onError(logoutEntity.exceptionMsg);
    }
    return logoutEntity;
  }



}