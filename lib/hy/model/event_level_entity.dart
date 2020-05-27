import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class EventLevelEntity with JsonConvert<EventLevelEntity> {
	@JSONField(name: "ExceptionMsg")
	dynamic exceptionMsg;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	List<EventLevelData> data;
}

class EventLevelData with JsonConvert<EventLevelData> {
	@JSONField(name: "EventLevelName")
	String eventLevelName;
	@JSONField(name: "ImageColor")
	String imageColor;
	@JSONField(name: "EventLevel")
	String eventLevel;
}
