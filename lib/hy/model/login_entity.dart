import 'package:flutter_learn/generated/json/base/json_convert_content.dart';
import 'package:flutter_learn/generated/json/base/json_filed.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	@JSONField(name: "Code")
	String code;
	@JSONField(name: "Data")
	LoginData data;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "ExceptionMsg")
	String exceptionMsg;
}

class LoginData with JsonConvert<LoginData> {
	@JSONField(name: "SrcID")
	dynamic srcID;
	@JSONField(name: "DestID")
	String destID;
	@JSONField(name: "SN")
	String sN;
	@JSONField(name: "User")
	dynamic user;
	@JSONField(name: "FC")
	String fC;
	@JSONField(name: "Ack")
	String ack;
	@JSONField(name: "Exp")
	String exp;
	@JSONField(name: "Ord")
	dynamic ord;
	@JSONField(name: "Dep")
	dynamic dep;
	@JSONField(name: "ACs")
	List<LoginDataAC> aCs;
	@JSONField(name: "Route")
	dynamic route;
}

class LoginDataAC with JsonConvert<LoginDataAC> {
	@JSONField(name: "F")
	String f;
	@JSONField(name: "N")
	String n;
	@JSONField(name: "V")
	LoginDataACsV v;
	@JSONField(name: "Op")
	int op;
}

class LoginDataACsV with JsonConvert<LoginDataACsV> {
	@JSONField(name: "id")
	String id;
	@JSONField(name: "access_token")
	String accessToken;
	@JSONField(name: "token_type")
	String tokenType;
	@JSONField(name: "refresh_token")
	String refreshToken;
	@JSONField(name: "expires_in")
	int expiresIn;
	String scope;
}
