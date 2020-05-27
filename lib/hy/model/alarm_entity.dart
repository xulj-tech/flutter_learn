import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class AlarmEntity with JsonConvert<AlarmEntity> {
	@JSONField(name: "ExceptionMsg")
	String exceptionMsg;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	AlarmData data;
}

class AlarmData with JsonConvert<AlarmData> {
	@JSONField(name: "DestID")
	String destID;
	@JSONField(name: "SN")
	String sN;
	@JSONField(name: "Exp")
	String exp;
	@JSONField(name: "Route")
	dynamic route;
	@JSONField(name: "Ack")
	String ack;
	@JSONField(name: "Dep")
	dynamic dep;
	@JSONField(name: "ACs")
	List<AlarmDataAC> aCs;
	@JSONField(name: "SrcID")
	String srcID;
	@JSONField(name: "Ord")
	dynamic ord;
	@JSONField(name: "User")
	String user;
	@JSONField(name: "FC")
	String fC;
}

class AlarmDataAC with JsonConvert<AlarmDataAC> {
	@JSONField(name: "V")
	List<AlarmDataACsV> v;
	@JSONField(name: "F")
	String f;
	@JSONField(name: "N")
	String n;
	@JSONField(name: "Op")
	int op;
}

class AlarmDataACsV with JsonConvert<AlarmDataACsV> {
	@JSONField(name: "UsrID")
	String usrID;
	@JSONField(name: "DealBrief")
	String dealBrief;
	@JSONField(name: "IsReported")
	bool isReported;
	@JSONField(name: "Actions")
	List<AlarmDataACsVAction> actions;
	@JSONField(name: "ConfirmType")
	int confirmType;
	@JSONField(name: "IsConfirmed")
	bool isConfirmed;
	@JSONField(name: "EventID")
	String eventID;
	@JSONField(name: "DealResult")
	String dealResult;
	@JSONField(name: "UsrName")
	String usrName;
	@JSONField(name: "OriginalEvent")
	AlarmDataACsVOriginalEvent originalEvent;
	@JSONField(name: "DealTime")
	String dealTime;
}

class AlarmDataACsVAction with JsonConvert<AlarmDataACsVAction> {
	dynamic id1;
	String id;
	String fid;
	@JSONField(name: "IsEnable")
	int isEnable;
	@JSONField(name: "Param")
	String param;
	@JSONField(name: "ActionType")
	int actionType;
}

class AlarmDataACsVOriginalEvent with JsonConvert<AlarmDataACsVOriginalEvent> {
	@JSONField(name: "EventTypeCode")
	String eventTypeCode;
	@JSONField(name: "EventLevelName")
	String eventLevelName;
	@JSONField(name: "TransactionId")
	String transactionId;
	@JSONField(name: "EventServerObjId")
	String eventServerObjId;
	@JSONField(name: "EventTypeName")
	String eventTypeName;
	@JSONField(name: "EventMode")
	int eventMode;
	@JSONField(name: "IsReported")
	bool isReported;
	@JSONField(name: "EventLevel")
	int eventLevel;
	List<AlarmDataACsVOriginalEventListEventSource> listEventSource;
	@JSONField(name: "AssociatedDevices")
	List<AlarmDataACsVOriginalEventAssociatedDevice> associatedDevices;
	@JSONField(name: "UserIDs")
	List<String> userIDs;
	@JSONField(name: "ActionFiles")
	List<dynamic> actionFiles;
	@JSONField(name: "EventId")
	String eventId;
	@JSONField(name: "HappenTime")
	String happenTime;
	@JSONField(name: "PolicyId")
	String policyId;
}

class AlarmDataACsVOriginalEventListEventSource with JsonConvert<AlarmDataACsVOriginalEventListEventSource> {
	@JSONField(name: "ExtendedParam")
	dynamic extendedParam;
	@JSONField(name: "DestObjectType")
	String destObjectType;
	@JSONField(name: "TransactionId")
	String transactionId;
	@JSONField(name: "Organization")
	String organization;
	@JSONField(name: "AdditionalInfo")
	dynamic additionalInfo;
	@JSONField(name: "IsCombination")
	bool isCombination;
	@JSONField(name: "EventDefineTypeId")
	String eventDefineTypeId;
	@JSONField(name: "Sources")
	dynamic sources;
	dynamic listDeviceRelation;
	@JSONField(name: "Area")
	String area;
	@JSONField(name: "InfoType")
	String infoType;
	@JSONField(name: "RecvTime")
	String recvTime;
	@JSONField(name: "IntactInfo")
	AlarmDataACsVOriginalEventListEventSourceIntactInfo intactInfo;
	@JSONField(name: "DestObjectId")
	String destObjectId;
}

class AlarmDataACsVOriginalEventListEventSourceIntactInfo with JsonConvert<AlarmDataACsVOriginalEventListEventSourceIntactInfo> {
	@JSONField(name: "Areas")
	dynamic areas;
	@JSONField(name: "Site")
	String site;
	@JSONField(name: "Output")
	String output;
	@JSONField(name: "Organization")
	String organization;
	@JSONField(name: "SourceInfo")
	String sourceInfo;
	@JSONField(name: "DeviceId")
	String deviceId;
	@JSONField(name: "SessionID")
	String sessionID;
	dynamic listPic;
	dynamic listPersionnel;
	@JSONField(name: "TimeOut")
	String timeOut;
	@JSONField(name: "ObjectId")
	String objectId;
	@JSONField(name: "SiteName")
	String siteName;
	@JSONField(name: "ResourceCode")
	String resourceCode;
	@JSONField(name: "ResourceType")
	String resourceType;
	@JSONField(name: "HappenTime")
	String happenTime;
	@JSONField(name: "DeviceType")
	String deviceType;
	@JSONField(name: "AssetType")
	String assetType;
	@JSONField(name: "DevcieName")
	String devcieName;
}

class AlarmDataACsVOriginalEventAssociatedDevice with JsonConvert<AlarmDataACsVOriginalEventAssociatedDevice> {
	String id;
	@JSONField(name: "OrgID")
	String orgID;
	@JSONField(name: "SitePoint")
	dynamic sitePoint;
	String enable;
	@JSONField(name: "PlatformID")
	dynamic platformID;
	@JSONField(name: "GL")
	dynamic gL;
	@JSONField(name: "DeviceCode")
	dynamic deviceCode;
	@JSONField(name: "Subsidiary")
	dynamic subsidiary;
	@JSONField(name: "FatherCode")
	String fatherCode;
	@JSONField(name: "Region")
	dynamic region;
	@JSONField(name: "DeviceNo")
	dynamic deviceNo;
	@JSONField(name: "Area")
	String area;
	@JSONField(name: "SortIndex")
	int sortIndex;
	@JSONField(name: "ObjID")
	dynamic objID;
	@JSONField(name: "DeviceMainType")
	String deviceMainType;
	@JSONField(name: "DeviceType")
	String deviceType;
	String name;
}
