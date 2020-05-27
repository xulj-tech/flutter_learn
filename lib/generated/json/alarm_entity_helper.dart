import 'package:flutter_learn/hy/model/alarm_entity.dart';

alarmEntityFromJson(AlarmEntity data, Map<String, dynamic> json) {
	if (json['ExceptionMsg'] != null) {
		data.exceptionMsg = json['ExceptionMsg']?.toString();
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new AlarmData().fromJson(json['Data']);
	}
	return data;
}

Map<String, dynamic> alarmEntityToJson(AlarmEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ExceptionMsg'] = entity.exceptionMsg;
	data['IsSuccess'] = entity.isSuccess;
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	return data;
}

alarmDataFromJson(AlarmData data, Map<String, dynamic> json) {
	if (json['DestID'] != null) {
		data.destID = json['DestID']?.toString();
	}
	if (json['SN'] != null) {
		data.sN = json['SN']?.toString();
	}
	if (json['Exp'] != null) {
		data.exp = json['Exp']?.toString();
	}
	if (json['Route'] != null) {
		data.route = json['Route'];
	}
	if (json['Ack'] != null) {
		data.ack = json['Ack']?.toString();
	}
	if (json['Dep'] != null) {
		data.dep = json['Dep'];
	}
	if (json['ACs'] != null) {
		data.aCs = new List<AlarmDataAC>();
		(json['ACs'] as List).forEach((v) {
			data.aCs.add(new AlarmDataAC().fromJson(v));
		});
	}
	if (json['SrcID'] != null) {
		data.srcID = json['SrcID']?.toString();
	}
	if (json['Ord'] != null) {
		data.ord = json['Ord'];
	}
	if (json['User'] != null) {
		data.user = json['User']?.toString();
	}
	if (json['FC'] != null) {
		data.fC = json['FC']?.toString();
	}
	return data;
}

Map<String, dynamic> alarmDataToJson(AlarmData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['DestID'] = entity.destID;
	data['SN'] = entity.sN;
	data['Exp'] = entity.exp;
	data['Route'] = entity.route;
	data['Ack'] = entity.ack;
	data['Dep'] = entity.dep;
	if (entity.aCs != null) {
		data['ACs'] =  entity.aCs.map((v) => v.toJson()).toList();
	}
	data['SrcID'] = entity.srcID;
	data['Ord'] = entity.ord;
	data['User'] = entity.user;
	data['FC'] = entity.fC;
	return data;
}

alarmDataACFromJson(AlarmDataAC data, Map<String, dynamic> json) {
	if (json['V'] != null) {
		data.v = new List<AlarmDataACsV>();
		(json['V'] as List).forEach((v) {
			data.v.add(new AlarmDataACsV().fromJson(v));
		});
	}
	if (json['F'] != null) {
		data.f = json['F']?.toString();
	}
	if (json['N'] != null) {
		data.n = json['N']?.toString();
	}
	if (json['Op'] != null) {
		data.op = json['Op']?.toInt();
	}
	return data;
}

Map<String, dynamic> alarmDataACToJson(AlarmDataAC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.v != null) {
		data['V'] =  entity.v.map((v) => v.toJson()).toList();
	}
	data['F'] = entity.f;
	data['N'] = entity.n;
	data['Op'] = entity.op;
	return data;
}

alarmDataACsVFromJson(AlarmDataACsV data, Map<String, dynamic> json) {
	if (json['UsrID'] != null) {
		data.usrID = json['UsrID']?.toString();
	}
	if (json['DealBrief'] != null) {
		data.dealBrief = json['DealBrief']?.toString();
	}
	if (json['IsReported'] != null) {
		data.isReported = json['IsReported'];
	}
	if (json['Actions'] != null) {
		data.actions = new List<AlarmDataACsVAction>();
		(json['Actions'] as List).forEach((v) {
			data.actions.add(new AlarmDataACsVAction().fromJson(v));
		});
	}
	if (json['ConfirmType'] != null) {
		data.confirmType = json['ConfirmType']?.toInt();
	}
	if (json['IsConfirmed'] != null) {
		data.isConfirmed = json['IsConfirmed'];
	}
	if (json['EventID'] != null) {
		data.eventID = json['EventID']?.toString();
	}
	if (json['DealResult'] != null) {
		data.dealResult = json['DealResult']?.toString();
	}
	if (json['UsrName'] != null) {
		data.usrName = json['UsrName']?.toString();
	}
	if (json['OriginalEvent'] != null) {
		data.originalEvent = new AlarmDataACsVOriginalEvent().fromJson(json['OriginalEvent']);
	}
	if (json['DealTime'] != null) {
		data.dealTime = json['DealTime']?.toString();
	}
	return data;
}

Map<String, dynamic> alarmDataACsVToJson(AlarmDataACsV entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['UsrID'] = entity.usrID;
	data['DealBrief'] = entity.dealBrief;
	data['IsReported'] = entity.isReported;
	if (entity.actions != null) {
		data['Actions'] =  entity.actions.map((v) => v.toJson()).toList();
	}
	data['ConfirmType'] = entity.confirmType;
	data['IsConfirmed'] = entity.isConfirmed;
	data['EventID'] = entity.eventID;
	data['DealResult'] = entity.dealResult;
	data['UsrName'] = entity.usrName;
	if (entity.originalEvent != null) {
		data['OriginalEvent'] = entity.originalEvent.toJson();
	}
	data['DealTime'] = entity.dealTime;
	return data;
}

alarmDataACsVActionFromJson(AlarmDataACsVAction data, Map<String, dynamic> json) {
	if (json['id1'] != null) {
		data.id1 = json['id1'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['fid'] != null) {
		data.fid = json['fid']?.toString();
	}
	if (json['IsEnable'] != null) {
		data.isEnable = json['IsEnable']?.toInt();
	}
	if (json['Param'] != null) {
		data.param = json['Param']?.toString();
	}
	if (json['ActionType'] != null) {
		data.actionType = json['ActionType']?.toInt();
	}
	return data;
}

Map<String, dynamic> alarmDataACsVActionToJson(AlarmDataACsVAction entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id1'] = entity.id1;
	data['id'] = entity.id;
	data['fid'] = entity.fid;
	data['IsEnable'] = entity.isEnable;
	data['Param'] = entity.param;
	data['ActionType'] = entity.actionType;
	return data;
}

alarmDataACsVOriginalEventFromJson(AlarmDataACsVOriginalEvent data, Map<String, dynamic> json) {
	if (json['EventTypeCode'] != null) {
		data.eventTypeCode = json['EventTypeCode']?.toString();
	}
	if (json['EventLevelName'] != null) {
		data.eventLevelName = json['EventLevelName']?.toString();
	}
	if (json['TransactionId'] != null) {
		data.transactionId = json['TransactionId']?.toString();
	}
	if (json['EventServerObjId'] != null) {
		data.eventServerObjId = json['EventServerObjId']?.toString();
	}
	if (json['EventTypeName'] != null) {
		data.eventTypeName = json['EventTypeName']?.toString();
	}
	if (json['EventMode'] != null) {
		data.eventMode = json['EventMode']?.toInt();
	}
	if (json['IsReported'] != null) {
		data.isReported = json['IsReported'];
	}
	if (json['EventLevel'] != null) {
		data.eventLevel = json['EventLevel']?.toInt();
	}
	if (json['listEventSource'] != null) {
		data.listEventSource = new List<AlarmDataACsVOriginalEventListEventSource>();
		(json['listEventSource'] as List).forEach((v) {
			data.listEventSource.add(new AlarmDataACsVOriginalEventListEventSource().fromJson(v));
		});
	}
	if (json['AssociatedDevices'] != null) {
		data.associatedDevices = new List<AlarmDataACsVOriginalEventAssociatedDevice>();
		(json['AssociatedDevices'] as List).forEach((v) {
			data.associatedDevices.add(new AlarmDataACsVOriginalEventAssociatedDevice().fromJson(v));
		});
	}
	if (json['UserIDs'] != null) {
		data.userIDs = json['UserIDs']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['ActionFiles'] != null) {
		data.actionFiles = new List<dynamic>();
		data.actionFiles.addAll(json['ActionFiles']);
	}
	if (json['EventId'] != null) {
		data.eventId = json['EventId']?.toString();
	}
	if (json['HappenTime'] != null) {
		data.happenTime = json['HappenTime']?.toString();
	}
	if (json['PolicyId'] != null) {
		data.policyId = json['PolicyId']?.toString();
	}
	return data;
}

Map<String, dynamic> alarmDataACsVOriginalEventToJson(AlarmDataACsVOriginalEvent entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['EventTypeCode'] = entity.eventTypeCode;
	data['EventLevelName'] = entity.eventLevelName;
	data['TransactionId'] = entity.transactionId;
	data['EventServerObjId'] = entity.eventServerObjId;
	data['EventTypeName'] = entity.eventTypeName;
	data['EventMode'] = entity.eventMode;
	data['IsReported'] = entity.isReported;
	data['EventLevel'] = entity.eventLevel;
	if (entity.listEventSource != null) {
		data['listEventSource'] =  entity.listEventSource.map((v) => v.toJson()).toList();
	}
	if (entity.associatedDevices != null) {
		data['AssociatedDevices'] =  entity.associatedDevices.map((v) => v.toJson()).toList();
	}
	data['UserIDs'] = entity.userIDs;
	if (entity.actionFiles != null) {
		data['ActionFiles'] =  [];
	}
	data['EventId'] = entity.eventId;
	data['HappenTime'] = entity.happenTime;
	data['PolicyId'] = entity.policyId;
	return data;
}

alarmDataACsVOriginalEventListEventSourceFromJson(AlarmDataACsVOriginalEventListEventSource data, Map<String, dynamic> json) {
	if (json['ExtendedParam'] != null) {
		data.extendedParam = json['ExtendedParam'];
	}
	if (json['DestObjectType'] != null) {
		data.destObjectType = json['DestObjectType']?.toString();
	}
	if (json['TransactionId'] != null) {
		data.transactionId = json['TransactionId']?.toString();
	}
	if (json['Organization'] != null) {
		data.organization = json['Organization']?.toString();
	}
	if (json['AdditionalInfo'] != null) {
		data.additionalInfo = json['AdditionalInfo'];
	}
	if (json['IsCombination'] != null) {
		data.isCombination = json['IsCombination'];
	}
	if (json['EventDefineTypeId'] != null) {
		data.eventDefineTypeId = json['EventDefineTypeId']?.toString();
	}
	if (json['Sources'] != null) {
		data.sources = json['Sources'];
	}
	if (json['listDeviceRelation'] != null) {
		data.listDeviceRelation = json['listDeviceRelation'];
	}
	if (json['Area'] != null) {
		data.area = json['Area']?.toString();
	}
	if (json['InfoType'] != null) {
		data.infoType = json['InfoType']?.toString();
	}
	if (json['RecvTime'] != null) {
		data.recvTime = json['RecvTime']?.toString();
	}
	if (json['IntactInfo'] != null) {
		data.intactInfo = new AlarmDataACsVOriginalEventListEventSourceIntactInfo().fromJson(json['IntactInfo']);
	}
	if (json['DestObjectId'] != null) {
		data.destObjectId = json['DestObjectId']?.toString();
	}
	return data;
}

Map<String, dynamic> alarmDataACsVOriginalEventListEventSourceToJson(AlarmDataACsVOriginalEventListEventSource entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ExtendedParam'] = entity.extendedParam;
	data['DestObjectType'] = entity.destObjectType;
	data['TransactionId'] = entity.transactionId;
	data['Organization'] = entity.organization;
	data['AdditionalInfo'] = entity.additionalInfo;
	data['IsCombination'] = entity.isCombination;
	data['EventDefineTypeId'] = entity.eventDefineTypeId;
	data['Sources'] = entity.sources;
	data['listDeviceRelation'] = entity.listDeviceRelation;
	data['Area'] = entity.area;
	data['InfoType'] = entity.infoType;
	data['RecvTime'] = entity.recvTime;
	if (entity.intactInfo != null) {
		data['IntactInfo'] = entity.intactInfo.toJson();
	}
	data['DestObjectId'] = entity.destObjectId;
	return data;
}

alarmDataACsVOriginalEventListEventSourceIntactInfoFromJson(AlarmDataACsVOriginalEventListEventSourceIntactInfo data, Map<String, dynamic> json) {
	if (json['Areas'] != null) {
		data.areas = json['Areas'];
	}
	if (json['Site'] != null) {
		data.site = json['Site']?.toString();
	}
	if (json['Output'] != null) {
		data.output = json['Output']?.toString();
	}
	if (json['Organization'] != null) {
		data.organization = json['Organization']?.toString();
	}
	if (json['SourceInfo'] != null) {
		data.sourceInfo = json['SourceInfo']?.toString();
	}
	if (json['DeviceId'] != null) {
		data.deviceId = json['DeviceId']?.toString();
	}
	if (json['SessionID'] != null) {
		data.sessionID = json['SessionID']?.toString();
	}
	if (json['listPic'] != null) {
		data.listPic = json['listPic'];
	}
	if (json['listPersionnel'] != null) {
		data.listPersionnel = json['listPersionnel'];
	}
	if (json['TimeOut'] != null) {
		data.timeOut = json['TimeOut']?.toString();
	}
	if (json['ObjectId'] != null) {
		data.objectId = json['ObjectId']?.toString();
	}
	if (json['SiteName'] != null) {
		data.siteName = json['SiteName']?.toString();
	}
	if (json['ResourceCode'] != null) {
		data.resourceCode = json['ResourceCode']?.toString();
	}
	if (json['ResourceType'] != null) {
		data.resourceType = json['ResourceType']?.toString();
	}
	if (json['HappenTime'] != null) {
		data.happenTime = json['HappenTime']?.toString();
	}
	if (json['DeviceType'] != null) {
		data.deviceType = json['DeviceType']?.toString();
	}
	if (json['AssetType'] != null) {
		data.assetType = json['AssetType']?.toString();
	}
	if (json['DevcieName'] != null) {
		data.devcieName = json['DevcieName']?.toString();
	}
	return data;
}

Map<String, dynamic> alarmDataACsVOriginalEventListEventSourceIntactInfoToJson(AlarmDataACsVOriginalEventListEventSourceIntactInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Areas'] = entity.areas;
	data['Site'] = entity.site;
	data['Output'] = entity.output;
	data['Organization'] = entity.organization;
	data['SourceInfo'] = entity.sourceInfo;
	data['DeviceId'] = entity.deviceId;
	data['SessionID'] = entity.sessionID;
	data['listPic'] = entity.listPic;
	data['listPersionnel'] = entity.listPersionnel;
	data['TimeOut'] = entity.timeOut;
	data['ObjectId'] = entity.objectId;
	data['SiteName'] = entity.siteName;
	data['ResourceCode'] = entity.resourceCode;
	data['ResourceType'] = entity.resourceType;
	data['HappenTime'] = entity.happenTime;
	data['DeviceType'] = entity.deviceType;
	data['AssetType'] = entity.assetType;
	data['DevcieName'] = entity.devcieName;
	return data;
}

alarmDataACsVOriginalEventAssociatedDeviceFromJson(AlarmDataACsVOriginalEventAssociatedDevice data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['OrgID'] != null) {
		data.orgID = json['OrgID']?.toString();
	}
	if (json['SitePoint'] != null) {
		data.sitePoint = json['SitePoint'];
	}
	if (json['enable'] != null) {
		data.enable = json['enable']?.toString();
	}
	if (json['PlatformID'] != null) {
		data.platformID = json['PlatformID'];
	}
	if (json['GL'] != null) {
		data.gL = json['GL'];
	}
	if (json['DeviceCode'] != null) {
		data.deviceCode = json['DeviceCode'];
	}
	if (json['Subsidiary'] != null) {
		data.subsidiary = json['Subsidiary'];
	}
	if (json['FatherCode'] != null) {
		data.fatherCode = json['FatherCode']?.toString();
	}
	if (json['Region'] != null) {
		data.region = json['Region'];
	}
	if (json['DeviceNo'] != null) {
		data.deviceNo = json['DeviceNo'];
	}
	if (json['Area'] != null) {
		data.area = json['Area']?.toString();
	}
	if (json['SortIndex'] != null) {
		data.sortIndex = json['SortIndex']?.toInt();
	}
	if (json['ObjID'] != null) {
		data.objID = json['ObjID'];
	}
	if (json['DeviceMainType'] != null) {
		data.deviceMainType = json['DeviceMainType']?.toString();
	}
	if (json['DeviceType'] != null) {
		data.deviceType = json['DeviceType']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> alarmDataACsVOriginalEventAssociatedDeviceToJson(AlarmDataACsVOriginalEventAssociatedDevice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['OrgID'] = entity.orgID;
	data['SitePoint'] = entity.sitePoint;
	data['enable'] = entity.enable;
	data['PlatformID'] = entity.platformID;
	data['GL'] = entity.gL;
	data['DeviceCode'] = entity.deviceCode;
	data['Subsidiary'] = entity.subsidiary;
	data['FatherCode'] = entity.fatherCode;
	data['Region'] = entity.region;
	data['DeviceNo'] = entity.deviceNo;
	data['Area'] = entity.area;
	data['SortIndex'] = entity.sortIndex;
	data['ObjID'] = entity.objID;
	data['DeviceMainType'] = entity.deviceMainType;
	data['DeviceType'] = entity.deviceType;
	data['name'] = entity.name;
	return data;
}