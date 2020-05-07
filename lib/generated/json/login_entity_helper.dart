import 'package:flutter_learn/hy/model/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new LoginData().fromJson(json['Data']);
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['ExceptionMsg'] != null) {
		data.exceptionMsg = json['ExceptionMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['IsSuccess'] = entity.isSuccess;
	data['ExceptionMsg'] = entity.exceptionMsg;
	return data;
}

loginDataFromJson(LoginData data, Map<String, dynamic> json) {
	if (json['SrcID'] != null) {
		data.srcID = json['SrcID'];
	}
	if (json['DestID'] != null) {
		data.destID = json['DestID']?.toString();
	}
	if (json['SN'] != null) {
		data.sN = json['SN']?.toString();
	}
	if (json['User'] != null) {
		data.user = json['User'];
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
		data.ord = json['Ord'];
	}
	if (json['Dep'] != null) {
		data.dep = json['Dep'];
	}
	if (json['ACs'] != null) {
		data.aCs = new List<LoginDataAC>();
		(json['ACs'] as List).forEach((v) {
			data.aCs.add(new LoginDataAC().fromJson(v));
		});
	}
	if (json['Route'] != null) {
		data.route = json['Route'];
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginData entity) {
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

loginDataACFromJson(LoginDataAC data, Map<String, dynamic> json) {
	if (json['F'] != null) {
		data.f = json['F']?.toString();
	}
	if (json['N'] != null) {
		data.n = json['N']?.toString();
	}
	if (json['V'] != null) {
		data.v = new LoginDataACsV().fromJson(json['V']);
	}
	if (json['Op'] != null) {
		data.op = json['Op']?.toInt();
	}
	return data;
}

Map<String, dynamic> loginDataACToJson(LoginDataAC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['F'] = entity.f;
	data['N'] = entity.n;
	if (entity.v != null) {
		data['V'] = entity.v.toJson();
	}
	data['Op'] = entity.op;
	return data;
}

loginDataACsVFromJson(LoginDataACsV data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['access_token'] != null) {
		data.accessToken = json['access_token']?.toString();
	}
	if (json['token_type'] != null) {
		data.tokenType = json['token_type']?.toString();
	}
	if (json['refresh_token'] != null) {
		data.refreshToken = json['refresh_token']?.toString();
	}
	if (json['expires_in'] != null) {
		data.expiresIn = json['expires_in']?.toInt();
	}
	if (json['scope'] != null) {
		data.scope = json['scope']?.toString();
	}
	return data;
}

Map<String, dynamic> loginDataACsVToJson(LoginDataACsV entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['refresh_token'] = entity.refreshToken;
	data['expires_in'] = entity.expiresIn;
	data['scope'] = entity.scope;
	return data;
}