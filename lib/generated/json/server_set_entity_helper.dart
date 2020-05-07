import 'package:flutter_learn/hy/model/server_set_entity.dart';

serverSetEntityFromJson(ServerSetEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new ServerSetData().fromJson(json['Data']);
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['ExceptionMsg'] != null) {
		data.exceptionMsg = json['ExceptionMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> serverSetEntityToJson(ServerSetEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['IsSuccess'] = entity.isSuccess;
	data['ExceptionMsg'] = entity.exceptionMsg;
	return data;
}

serverSetDataFromJson(ServerSetData data, Map<String, dynamic> json) {
	if (json['SrcID'] != null) {
		data.srcID = json['SrcID']?.toString();
	}
	if (json['DestID'] != null) {
		data.destID = json['DestID']?.toString();
	}
	if (json['SN'] != null) {
		data.sN = json['SN']?.toString();
	}
	if (json['User'] != null) {
		data.user = json['User']?.toString();
	}
	if (json['FC'] != null) {
		data.fC = json['FC']?.toString();
	}
	if (json['Ack'] != null) {
		data.ack = json['Ack']?.toString();
	}
	if (json['Exp'] != null) {
		data.exp = json['Exp']?.toString();
	}
	if (json['Ord'] != null) {
		data.ord = json['Ord']?.toString();
	}
	if (json['Dep'] != null) {
		data.dep = json['Dep']?.toString();
	}
	if (json['ACs'] != null) {
		data.aCs = new List<ServerSetDataAC>();
		(json['ACs'] as List).forEach((v) {
			data.aCs.add(new ServerSetDataAC().fromJson(v));
		});
	}
	if (json['Route'] != null) {
		data.route = json['Route'];
	}
	return data;
}

Map<String, dynamic> serverSetDataToJson(ServerSetData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['SrcID'] = entity.srcID;
	data['DestID'] = entity.destID;
	data['SN'] = entity.sN;
	data['User'] = entity.user;
	data['FC'] = entity.fC;
	data['Ack'] = entity.ack;
	data['Exp'] = entity.exp;
	data['Ord'] = entity.ord;
	data['Dep'] = entity.dep;
	if (entity.aCs != null) {
		data['ACs'] =  entity.aCs.map((v) => v.toJson()).toList();
	}
	data['Route'] = entity.route;
	return data;
}

serverSetDataACFromJson(ServerSetDataAC data, Map<String, dynamic> json) {
	if (json['F'] != null) {
		data.f = json['F']?.toString();
	}
	if (json['N'] != null) {
		data.n = json['N']?.toString();
	}
	if (json['V'] != null) {
		data.v = new ServerSetDataACsV().fromJson(json['V']);
	}
	if (json['Op'] != null) {
		data.op = json['Op']?.toInt();
	}
	return data;
}

Map<String, dynamic> serverSetDataACToJson(ServerSetDataAC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['F'] = entity.f;
	data['N'] = entity.n;
	if (entity.v != null) {
		data['V'] = entity.v.toJson();
	}
	data['Op'] = entity.op;
	return data;
}

serverSetDataACsVFromJson(ServerSetDataACsV data, Map<String, dynamic> json) {
	if (json['ObjID'] != null) {
		data.objID = json['ObjID']?.toString();
	}
	if (json['ObjName'] != null) {
		data.objName = json['ObjName']?.toString();
	}
	if (json['Protocal'] != null) {
		data.protocal = json['Protocal'];
	}
	if (json['Param'] != null) {
		data.param = json['Param'];
	}
	if (json['OrgCode'] != null) {
		data.orgCode = json['OrgCode']?.toString();
	}
	if (json['ObjType'] != null) {
		data.objType = json['ObjType']?.toString();
	}
	if (json['SortIndex'] != null) {
		data.sortIndex = json['SortIndex'];
	}
	return data;
}

Map<String, dynamic> serverSetDataACsVToJson(ServerSetDataACsV entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ObjID'] = entity.objID;
	data['ObjName'] = entity.objName;
	data['Protocal'] = entity.protocal;
	data['Param'] = entity.param;
	data['OrgCode'] = entity.orgCode;
	data['ObjType'] = entity.objType;
	data['SortIndex'] = entity.sortIndex;
	return data;
}