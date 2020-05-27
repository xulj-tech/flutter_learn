import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class EventLevelNumberEntity with JsonConvert<EventLevelNumberEntity> {
	@JSONField(name: "ExceptionMsg")
	String exceptionMsg;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	EventLevelNumberData data;
}

class EventLevelNumberData with JsonConvert<EventLevelNumberData> {
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
	List<EventLevelNumberDataAC> aCs;
	@JSONField(name: "SrcID")
	String srcID;
	@JSONField(name: "Ord")
	dynamic ord;
	@JSONField(name: "User")
	String user;
	@JSONField(name: "FC")
	String fC;
}

class EventLevelNumberDataAC with JsonConvert<EventLevelNumberDataAC> {
	@JSONField(name: "V")
	List<EventLevelNumberDataACsV> v;
	@JSONField(name: "F")
	String f;
	@JSONField(name: "N")
	String n;
	@JSONField(name: "Op")
	int op;
}

class EventLevelNumberDataACsV with JsonConvert<EventLevelNumberDataACsV> {
	@JSONField(name: "Count")
	int count;
	@JSONField(name: "EventLevel")
	int eventLevel;
}
