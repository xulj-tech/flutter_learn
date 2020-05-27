import 'package:flutter_learn/hy/model/event_level_number_entity.dart';

eventLevelNumberEntityFromJson(EventLevelNumberEntity data, Map<String, dynamic> json) {
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
		data.data = new EventLevelNumberData().fromJson(json['Data']);
	}
	return data;
}

Map<String, dynamic> eventLevelNumberEntityToJson(EventLevelNumberEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ExceptionMsg'] = entity.exceptionMsg;
	data['IsSuccess'] = entity.isSuccess;
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	return data;
}

eventLevelNumberDataFromJson(EventLevelNumberData data, Map<String, dynamic> json) {
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
		data.aCs = new List<EventLevelNumberDataAC>();
		(json['ACs'] as List).forEach((v) {
			data.aCs.add(new EventLevelNumberDataAC().fromJson(v));
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

Map<String, dynamic> eventLevelNumberDataToJson(EventLevelNumberData entity) {
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

eventLevelNumberDataACFromJson(EventLevelNumberDataAC data, Map<String, dynamic> json) {
	if (json['V'] != null) {
		data.v = new List<EventLevelNumberDataACsV>();
		(json['V'] as List).forEach((v) {
			data.v.add(new EventLevelNumberDataACsV().fromJson(v));
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

Map<String, dynamic> eventLevelNumberDataACToJson(EventLevelNumberDataAC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.v != null) {
		data['V'] =  entity.v.map((v) => v.toJson()).toList();
	}
	data['F'] = entity.f;
	data['N'] = entity.n;
	data['Op'] = entity.op;
	return data;
}

eventLevelNumberDataACsVFromJson(EventLevelNumberDataACsV data, Map<String, dynamic> json) {
	if (json['Count'] != null) {
		data.count = json['Count']?.toInt();
	}
	if (json['EventLevel'] != null) {
		data.eventLevel = json['EventLevel']?.toInt();
	}
	return data;
}

Map<String, dynamic> eventLevelNumberDataACsVToJson(EventLevelNumberDataACsV entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Count'] = entity.count;
	data['EventLevel'] = entity.eventLevel;
	return data;
}