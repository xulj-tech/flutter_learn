import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/model/alarm_entity.dart';
import 'package:flutter_learn/hy/utils/util.dart';

class ErrorAlarmPage extends StatefulWidget {
  static const routeName="/errorAlarm";

  @override
  _ErrorAlarmPageState createState() => _ErrorAlarmPageState();
}

class _ErrorAlarmPageState extends State<ErrorAlarmPage> {
  Map argument;

  List<Color> _backGroundColors = [Colors.white, Colors.white, Colors.white, Colors.white];
  List<Color> _titleColors = [Colors.black, Colors.black, Colors.black, Colors.black];
  List<Color> _clearAlarmBackGroundColors = [Colors.white, Colors.white];
  List<Color> _clearAlarmColors = [Colors.black, Colors.black];

  @override
  Widget build(BuildContext context) {
    argument = ModalRoute.of(context).settings.arguments;
    String title = argument['title'];
    return Scaffold(
        appBar: Util.getAppBar(context, '处置（$title）'),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16, 20, 12, 0),
          child:conditonListView(title)
        ),
    );
  }

  Widget conditonListView(String title){

    bool isFault = false;
    bool isTest = false;

    if (title == '测试') {
      isTest = true;
    } else if (title == '故障') {
      isFault = true;
    }

    List titles = [];
    if (isFault) {
      titles.add({'设备报警屏蔽上报：':['否', '是']});
    } else {
      if (isTest) {
        titles.add({'测试原因：':['维修测试','演练测试','检查测试','其他测试']});
      } else {
        titles.add({'误报原因：':['人为原因','设备原因','环境原因','其他原因']});
      }
      titles.add({'是否消警：':['否', '是']});
    }

    List<Widget> widgets = [];
    List.generate(titles.length, (index) {
        Map<String, List> map = titles[index];
       return map.keys.forEach((key){
          widgets.add(errorConditon(key, map[key]));
        });
    });

    widgets.add(dealExplanation(),);

    return Column(
      children: widgets
    );
  }

  Widget errorConditon(String title, List errorConditons){

    List<Widget> widgets = [];

    List.generate(errorConditons.length, (index) {
      return widgets.add(conditonItem(title, index, errorConditons));
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
            alignment:Alignment.centerLeft ,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: widgets
          )

        ],
      ),
    );
  }

  Widget conditonItem(String title, int index, List errorConditons){

    bool clearAlarm = false;
    if (title == '是否消警：' || title == '设备报警屏蔽上报：') {
      clearAlarm = true;
    }

    return GestureDetector(
      onTap: (){
        setState(() {
          if (clearAlarm) {
            _clearAlarmBackGroundColors = [Colors.white, Colors.white];
            _clearAlarmColors = [Colors.black, Colors.black];
            _clearAlarmBackGroundColors[index] = Colors.blue;
            _clearAlarmColors[index] = Colors.white;
          } else {
            _backGroundColors = [Colors.white, Colors.white, Colors.white, Colors.white];
            _titleColors = [Colors.black, Colors.black, Colors.black, Colors.black];
            _backGroundColors[index] = Colors.blue;
            _titleColors[index] = Colors.white;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Colors.grey, width: 1),
          color: clearAlarm ? _clearAlarmBackGroundColors[index]:_backGroundColors[index],
        ),
        width: 80,
        height: 32,
        child: Center(
            child: Text(
                errorConditons[index],
                style: TextStyle(
                  color:clearAlarm ? _clearAlarmColors[index] : _titleColors[index],
                  fontSize: 16,
                ),
              ),
          ),

      ),
    );

  }

  Widget dealExplanation(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 12),
      child: Column(
        children: <Widget>[
          Container(
//            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            alignment:Alignment.centerLeft ,
            child: Text(
              '处置说明：',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight:FontWeight.bold
              ),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 20),
            decoration:BoxDecoration(
              border:  Border.all(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                maxLines:null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '请输入内容',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  border: InputBorder.none,
                ),

                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

          ),
          Container(
            height: 40,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: FlatButton(
                  onPressed: (){

                  },
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  color: Colors.blue,
                  child: Text(
                    '确定',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
