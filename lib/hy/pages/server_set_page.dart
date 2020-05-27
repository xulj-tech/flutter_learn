import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:flutter_learn/hy/utils/sp_util.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/utils/size_fit.dart';

import '../utils/util.dart';

class ServerSet extends StatelessWidget{
  static const routeName="/serverSet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.getAppBar(context, "地址配置"),
      body: ServerSetContent(),
    );
  }
}

class ServerSetContent extends StatefulWidget{
  @override
  _ServerSetContentState createState() => _ServerSetContentState();
}

class _ServerSetContentState extends State<ServerSetContent> {
  TextEditingController _ipController = new TextEditingController();
  TextEditingController _portController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  var _isIpClear = false;
  var _isPortClear = false;
  var _ip = '';
  var _port = '';

  @override
  void initState() {
    _initView();
    super.initState();
  }

  void _initView(){
    SpUtil.getServerIp((String value){
      if(!Util.isNullOrEmpty(value)){
        _ipController.text=value;
    }});

    SpUtil.getServerPort((String value){
      if(!Util.isNullOrEmpty(value)){
        _portController.text=value;
      }
    });

    _ipController.addListener(() {
      if (_ipController.text.length > 0) {
        _isIpClear = true;
      } else {
        _isIpClear = false;
      }
    });

    _portController.addListener(() {
      if (_portController.text.length > 0) {
        _isPortClear = true;
      } else {
        _isPortClear = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil.px(15)),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ipTextFormField(),
            portTextFormField(),
            submitBtn()
          ],
        ),
      ),
    );
  }

  Widget ipTextFormField() {
    return TextFormField(
      controller: _ipController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "192.168.0.1",
        labelText: "IP地址:",
        suffixIcon: (_isIpClear)
            ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _ipController.clear();
          },
        )
            : null,
      ),
      onSaved: (String value) {
        _ip = value;
      },
    );
  }

  Widget portTextFormField() {
    return TextFormField(
      controller: _portController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "8080",
        labelText: "端口：",
        suffixIcon: (_isPortClear)
            ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _portController.clear();
          },
        )
            : null,
      ),
      onSaved: (String value) {
        _port = value;
      },
    );
  }

  Widget submitBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Text("登 录", style: TextStyle(fontSize: 16),),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    FormState state = _formKey.currentState as FormState;
                    if (state.validate()) {
                      state.save();
                      if (checkText(context, _ip, _port)) {
                        CommonService.serverRequest(_ip, _port,
                            onSuccess: (value) {
                              SpUtil.putServerIp(_ip);
                              SpUtil.putServerPort(_port);
                              SpUtil.putBaseUrl("http://$_ip:$_port/");
                              SpUtil.putSrcID(value.data.srcID);
                              Navigator.of(context).pop();
                            },
                            onError: (error) {
                              Util.showMessageDialog(context, error);
                            }
                        );
                      }
                    }
                  }))
        ],
      ),
    );
  }
}
bool checkText(BuildContext context,String ip,String port){
  if(ip.isEmpty){
    Util.showToast("ip地址不能为空");
    return false;
  }
  if(port.isEmpty){
    Util.showToast("端口不能为空");
    return false;
  }
  return true;
}