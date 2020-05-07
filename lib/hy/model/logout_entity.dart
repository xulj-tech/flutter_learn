import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class LogoutEntity with JsonConvert<LogoutEntity> {
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	LogoutData data;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "ExceptionMsg")
	String exceptionMsg;
}

class LogoutData with JsonConvert<LogoutData> {
	@JSONField(name: "SrcID")
	String srcID;
	@JSONField(name: "DestID")
	String destID;
	@JSONField(name: "SN")
	String sN;
	@JSONField(name: "User")
	String user;
	@JSONField(name: "FC")
	String fC;
	@JSONField(name: "Ack")
	String ack;
	@JSONField(name: "Exp")
	String exp;
	@JSONField(name: "Ord")
	String ord;
	@JSONField(name: "Dep")
	String dep;
	@JSONField(name: "ACs")
	List<LogoutDataAC> aCs;
	@JSONField(name: "Route")
	dynamic route;
}

class LogoutDataAC with JsonConvert<LogoutDataAC> {
	@JSONField(name: "F")
	String f;
	@JSONField(name: "N")
	String n;
	@JSONField(name: "V")
	LogoutDataACsV v;
	@JSONField(name: "Op")
	int op;
}

class LogoutDataACsV with JsonConvert<LogoutDataACsV> {
	String tokenId;
}
