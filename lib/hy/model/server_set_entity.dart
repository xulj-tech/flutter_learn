import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class ServerSetEntity with JsonConvert<ServerSetEntity> {
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	ServerSetData data;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "ExceptionMsg")
	String exceptionMsg;
}

class ServerSetData with JsonConvert<ServerSetData> {
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
	List<ServerSetDataAC> aCs;
	@JSONField(name: "Route")
	dynamic route;
}

class ServerSetDataAC with JsonConvert<ServerSetDataAC> {
	@JSONField(name: "F")
	String f;
	@JSONField(name: "N")
	String n;
	@JSONField(name: "V")
	ServerSetDataACsV v;
	@JSONField(name: "Op")
	int op;
}

class ServerSetDataACsV with JsonConvert<ServerSetDataACsV> {
	@JSONField(name: "ObjID")
	String objID;
	@JSONField(name: "ObjName")
	String objName;
	@JSONField(name: "Protocal")
	dynamic protocal;
	@JSONField(name: "Param")
	dynamic param;
	@JSONField(name: "OrgCode")
	String orgCode;
	@JSONField(name: "ObjType")
	String objType;
	@JSONField(name: "SortIndex")
	dynamic sortIndex;
}
