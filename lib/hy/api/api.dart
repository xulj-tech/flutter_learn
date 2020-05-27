class Api{
  static const String LOGIN = "http://www.wanandroid.com/banner/json";

  /// 获取服务对象信息
  static const String URL_SET_GATEWAY=  "api/System/SetGateway";
  static const String FC_XT_GET_OBJ_ID_0001=  "FC_XT_GET_OBJ_ID_0001";


  ///登录
  static const String URL_LOGIN=  "api/User/LoginNew";
  static const String FC_VF_VEFY_DNLD_0001=  "FC_AUTH_LOGIN_0001";


  /// 登出
  static const String URL_LOGOUT=  "api/User/LogoutNew";
  static const String FC_XT_VEFY_CANCEL_0001=  "FC_XT_VEFY_CANCEL_0001";

  //报警
  static const String URL_GET_ALARM_LIST = "api/Alarm/GetEventListPart";
  static const String FC_EVENT_GET_PART_EVENTLIST_0001 = "FC_EVENT_GET_PART_EVENTLIST_0001";

  static const String URL_GET_ALARM_RULE_INFO = "/api/Alarm/GetAlarmRuleInfo";
  static const String FC_XT_GET_CFGDATA_0001 = "FC_XT_GET_CFGDATA_0001";

  static const String URL_GET_ALARM_EVENTCOUNT = "/api/Alarm/GetEventCount";
  static const String FC_EVENT_GET_EVENTCOUNT_0001 = "FC_EVENT_GET_EVENTCOUNT_0001";

  static const String URL_GET_ALARM_PART_EVENTLIST = "api/Alarm/GetEventListPart";
  static const String FC_EVENT_GET_PART_EVENTLIST = "FC_EVENT_GET_PART_EVENTLIST_0001";

  ///获取页面URL
  static const String URL_RELATION=  "api/System/Relation";
  static const String FC_WEB_GZLC_RK_0001 = "FC_Web_GZLC_RK_0001";
  static const String FC_XT_CLIENT_GET_CONFIG_0001 = "FC_XT_CLIENT_GET_CONFIG_0001";


  static const String CODE_CJ = "FC_Web_WLCK_CJ_0001";  //场景
  static const String CODE_SP = "FC_Web_WLCK_SP_0001";  //视频
  static const String CODE_MJ = "FC_Web_WLCK_MJ_0001";  //门禁
  static const String CODE_DJ = "FC_Web_WLCK_DJ_0001";  //对讲
  static const String CODE_GB = "FC_Web_WLCK_GB_0001";  //广播
  static const String CODE_DG = "FC_Web_WLCK_DG_0001";  //灯光

  static const String FC_Web_ZHHY_VIPCJ_0001="FC_Web_ZHHY_VIPCJ_0001";  //场景管理
  static const String FC_Web_ZHHY_FKAPPYY_0001="FC_Web_ZHHY_FKAPPYY_0001";  //访客预约
  static const String FC_Web_ZHHY_SRCJ_0001="FC_Web_ZHHY_SRCJ_0001";  //生日祝福
  static const String FC_Web_ZHHY_ZHGBDB_0001="FC_Web_ZHHY_ZHGBDB_0001";  //广播点播

  static const String FC_Web_BJGL_BG_0001="FC_Web_BJGL_BG_0001"; //报警管理
  ///  标准知识库
  static const String FC_Web_Knowledge_Standard = "FC_Web_Knowledge_Standard";

  ///  本级知识库
  static const String FC_Web_Knowledge_Level = "FC_Web_Knowledge_Level";



}