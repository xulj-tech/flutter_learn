import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class RelationEntity with JsonConvert<RelationEntity> {
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	RelationData data;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "ExceptionMsg")
	String exceptionMsg;
}

class RelationData with JsonConvert<RelationData> {
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
	List<RelationDataAC> aCs;
	@JSONField(name: "Route")
	dynamic route;
}

class RelationDataAC with JsonConvert<RelationDataAC> {
	@JSONField(name: "F")
	String f;
	@JSONField(name: "N")
	dynamic n;
	@JSONField(name: "V")
	List<RelationDataACsV> v;
	@JSONField(name: "Op")
	int op;
}

class RelationDataACsV with JsonConvert<RelationDataACsV> {
	String relationName;
	String srcServerType;
	String srcServerId;
	String srcConsumerFc;
	String destServerType;
	String destServerId;
	String destProviderFc;
	String destEntranceId;
	String destIp;
	String destPort;
	String destProtocol;
	String destUrl;
	String userName;
	String password;
}
