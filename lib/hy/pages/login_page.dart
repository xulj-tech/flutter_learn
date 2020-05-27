import 'package:flutter_learn/hy/api/api_request.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:flutter_learn/hy/pages/home_page.dart';
import 'package:flutter_learn/hy/pages/server_set_page.dart';
import 'package:flutter_learn/hy/utils/sp_util.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/utils/size_fit.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/loginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Image.asset(
            Util.getImgPath("login_bg"),
            width: double.infinity,
            height: ScreenUtil.px(300),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: ScreenUtil.px(30),
          ),
          LoginContent(),
        ],
      )),
    );
  }
}

class LoginContent extends StatefulWidget {
  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮
  var _username = '';
  var _password = '';
  var _destID = '';

  @override
  void initState() {
    setState(() {
      SpUtil.getSrcID((String value) {
        _destID = value;
      });
    });

    SpUtil.getUserName((String value) {
      if (!Util.isNullOrEmpty(value)) {
        _userNameController.text = value;
      }
    });

    SpUtil.getPassword((String value) {
      if (!Util.isNullOrEmpty(value)) {
        _pwdController.text = value;
      }
    });

    _userNameController.addListener(() {
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil.px(15)),
      child: Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            userNameText(),
            SizedBox(
              height: ScreenUtil.px(20),
            ),
            passwordText(),
            bottomArea(),
            submitBtn()
          ],
        ),
      ),
    );
  }

  Widget userNameText() {
    return TextFormField(
      controller: _userNameController,
      //设置键盘类型
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "请输入用户名",
        prefixIcon: Icon(Icons.person),
        //尾部添加清除按钮
        suffixIcon: (_isShowClear)
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  // 清空输入框内容
                  _userNameController.clear();
                },
              )
            : null,
      ),
      //保存数据
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      controller: _pwdController,
      decoration: InputDecoration(
          hintText: "请输入密码",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isShowPwd = !_isShowPwd;
              });
            },
          )),
      obscureText: !_isShowPwd,
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget submitBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Text(
                    "登 录",
                    style: TextStyle(fontSize: 16),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    FormState state = _formKey.currentState as FormState;
                    if (state.validate()) {
                      state.save();
                      if (checkText(context, _username, _password)) {
                        _login(_password);
                      }
                    }
                  }))
        ],
      ),
    );
  }

   _login(String pwd){

     SpUtil.getBaseUrl((value){
       print("---url------$value");
       if(Util.isNullOrEmpty(value)){
         Util.showToast("请点击地址配置，设置IP与端口");
         return null;
       }else{
         ApiRequest.setBaseUrl("","",url:value);

         Util.aesEncrypt(_username + _password, "flowhysuseraesco").then((value) {
           _password = value;
           CommonService.loginRequest(
               _username, _password, _destID,
               onSuccess: (value) {
                 SpUtil.putUserName(_username);
                 SpUtil.putPassword(pwd);
                 Navigator.of(context).pushNamed(HomePage.routeName);
               }, onError: (error) {
             Util.showMessageDialog(context, error);
           });
         });
       }
     });
  }

  Widget bottomArea() {
    return new Container(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "忘记密码?",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14.0,
              ),
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Text(
              "地址配置",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(ServerSet.routeName);
            },
          )
        ],
      ),
    );
  }
}

bool checkText(BuildContext context, String name, String pwd) {
  if (name.isEmpty) {
    Util.showToast("用户名不能为空");
    return false;
  }
  if (pwd.isEmpty) {
    Util.showToast("密码不能为空");
    return false;
  }
  return true;
}
