import 'package:flutter_learn/hy/model/relation_entity.dart';

relationEntityFromJson(RelationEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new RelationData().fromJson(json['Data']);
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['ExceptionMsg'] != null) {
		data.exceptionMsg = json['ExceptionMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> relationEntityToJson(RelationEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['IsSuccess'] = entity.isSuccess;
	data['ExceptionMsg'] = entity.exceptionMsg;
	return data;
}

relationDataFromJson(RelationData data, Map<String, dynamic> json) {
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
		data.aCs = new List<RelationDataAC>();
		(json['ACs'] as List).forEach((v) {
			data.aCs.add(new RelationDataAC().fromJson(v));
		});
	}
	if (json['Route'] != null) {
		data.route = json['Route'];
	}
	return data;
}

Map<String, dynamic> relationDataToJson(RelationData entity) {
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

relationDataACFromJson(RelationDataAC data, Map<String, dynamic> json) {
	if (json['F'] != null) {
		data.f = json['F']?.toString();
	}
	if (json['N'] != null) {
		data.n = json['N'];
	}
	if (json['V'] != null) {
		data.v = new List<RelationDataACsV>();
		(json['V'] as List).forEach((v) {
			data.v.add(new RelationDataACsV().fromJson(v));
		});
	}
	if (json['Op'] != null) {
		data.op = json['Op']?.toInt();
	}
	return data;
}

Map<String, dynamic> relationDataACToJson(RelationDataAC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['F'] = entity.f;
	data['N'] = entity.n;
	if (entity.v != null) {
		data['V'] =  entity.v.map((v) => v.toJson()).toList();
	}
	data['Op'] = entity.op;
	return data;
}

relationDataACsVFromJson(RelationDataACsV data, Map<String, dynamic> json) {
	if (json['relationName'] != null) {
		data.relationName = json['relationName']?.toString();
	}
	if (json['srcServerType'] != null) {
		data.srcServerType = json['srcServerType']?.toString();
	}
	if (json['srcServerId'] != null) {
		data.srcServerId = json['srcServerId']?.toString();
	}
	if (json['srcConsumerFc'] != null) {
		data.srcConsumerFc = json['srcConsumerFc']?.toString();
	}
	if (json['destServerType'] != null) {
		data.destServerType = json['destServerType']?.toString();
	}
	if (json['destServerId'] != null) {
		data.destServerId = json['destServerId']?.toString();
	}
	if (json['destProviderFc'] != null) {
		data.destProviderFc = json['destProviderFc']?.toString();
	}
	if (json['destEntranceId'] != null) {
		data.destEntranceId = json['destEntranceId']?.toString();
	}
	if (json['destIp'] != null) {
		data.destIp = json['destIp']?.toString();
	}
	if (json['destPort'] != null) {
		data.destPort = json['destPort']?.toString();
	}
	if (json['destProtocol'] != null) {
		data.destProtocol = json['destProtocol']?.toString();
	}
	if (json['destUrl'] != null) {
		data.destUrl = json['destUrl']?.toString();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	if (json['password'] != null) {
		data.password = json['password']?.toString();
	}
	return data;
}

Map<String, dynamic> relationDataACsVToJson(RelationDataACsV entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['relationName'] = entity.relationName;
	data['srcServerType'] = entity.srcServerType;
	data['srcServerId'] = entity.srcServerId;
	data['srcConsumerFc'] = entity.srcConsumerFc;
	data['destServerType'] = entity.destServerType;
	data['destServerId'] = entity.destServerId;
	data['destProviderFc'] = entity.destProviderFc;
	data['destEntranceId'] = entity.destEntranceId;
	data['destIp'] = entity.destIp;
	data['destPort'] = entity.destPort;
	data['destProtocol'] = entity.destProtocol;
	data['destUrl'] = entity.destUrl;
	data['userName'] = entity.userName;
	data['password'] = entity.password;
	return data;
}