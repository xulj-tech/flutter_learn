import 'package:flutter_learn/hy/model/logout_entity.dart';

logoutEntityFromJson(LogoutEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new LogoutData().fromJson(json['Data']);
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['ExceptionMsg'] != null) {
		data.exceptionMsg = json['ExceptionMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> logoutEntityToJson(LogoutEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['IsSuccess'] = entity.isSuccess;
	data['ExceptionMsg'] = entity.exceptionMsg;
	return data;
}

logoutDataFromJson(LogoutData data, Map<String, dynamic> json) {
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
		data.aCs = new List<LogoutDataAC>();
		(json['ACs'] as List).forEach((v) {
			data.aCs.add(new LogoutDataAC().fromJson(v));
		});
	}
	if (json['Route'] != null) {
		data.route = json['Route'];
	}
	return data;
}

Map<String, dynamic> logoutDataToJson(LogoutData entity) {
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

logoutDataACFromJson(LogoutDataAC data, Map<String, dynamic> json) {
	if (json['F'] != null) {
		data.f = json['F']?.toString();
	}
	if (json['N'] != null) {
		data.n = json['N']?.toString();
	}
	if (json['V'] != null) {
		data.v = new LogoutDataACsV().fromJson(json['V']);
	}
	if (json['Op'] != null) {
		data.op = json['Op']?.toInt();
	}
	return data;
}

Map<String, dynamic> logoutDataACToJson(LogoutDataAC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['F'] = entity.f;
	data['N'] = entity.n;
	if (entity.v != null) {
		data['V'] = entity.v.toJson();
	}
	data['Op'] = entity.op;
	return data;
}

logoutDataACsVFromJson(LogoutDataACsV data, Map<String, dynamic> json) {
	if (json['tokenId'] != null) {
		data.tokenId = json['tokenId']?.toString();
	}
	return data;
}

Map<String, dynamic> logoutDataACsVToJson(LogoutDataACsV entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tokenId'] = entity.tokenId;
	return data;
}