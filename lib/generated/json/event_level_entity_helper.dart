import 'package:flutter_learn/hy/model/event_level_entity.dart';

eventLevelEntityFromJson(EventLevelEntity data, Map<String, dynamic> json) {
	if (json['ExceptionMsg'] != null) {
		data.exceptionMsg = json['ExceptionMsg'];
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new List<EventLevelData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new EventLevelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> eventLevelEntityToJson(EventLevelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ExceptionMsg'] = entity.exceptionMsg;
	data['IsSuccess'] = entity.isSuccess;
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

eventLevelDataFromJson(EventLevelData data, Map<String, dynamic> json) {
	if (json['EventLevelName'] != null) {
		data.eventLevelName = json['EventLevelName']?.toString();
	}
	if (json['ImageColor'] != null) {
		data.imageColor = json['ImageColor']?.toString();
	}
	if (json['EventLevel'] != null) {
		data.eventLevel = json['EventLevel']?.toString();
	}
	return data;
}

Map<String, dynamic> eventLevelDataToJson(EventLevelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['EventLevelName'] = entity.eventLevelName;
	data['ImageColor'] = entity.imageColor;
	data['EventLevel'] = entity.eventLevel;
	return data;
}