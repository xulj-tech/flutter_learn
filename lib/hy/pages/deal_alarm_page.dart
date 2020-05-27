import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DealAlarmPage extends StatefulWidget {
  static const routeName="/dealAlarm";

  @override
  _DealAlarmPageState createState() => _DealAlarmPageState();
}

class _DealAlarmPageState extends State<DealAlarmPage> {

  List _alarmLevels = ['一级警情','二级警情','三级警情'];
  String _alarmLevel = '';

  Color _noColor = Colors.blue;
  Color _noTextColor = Colors.white;
  Color _yesColor = Colors.white;
  Color _yesTextColor = Colors.black;

  Color _noColorUpgrade = Colors.blue;
  Color _noTextColorUpgrade = Colors.white;
  Color _yesColorUpgrade = Colors.white;
  Color _yesTextColorUpgrade = Colors.black;

  bool _isClearAlarm = false;
  bool _isUpgradeAlarm = false;


  //初始化全部复选框按钮默认都是false
  List<bool> _checkedList=[false,false,false,false,false,false,false];

  final double listSpec = 4.0;
  String stateText;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Util.getAppBar(context, '处置（真实报警）'),
      body: Container(
        color: Color(int.parse('0xfff2f2f2')),
        child: ListView(
          children: <Widget>[
            dealCondition(context),
            dealResult(context),
            dealExplanation(context),
          ],
        ),
      )
    );

  }

  Widget dealCondition(BuildContext context){

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
      child: Column(
        children: <Widget>[
          dealSelect('是否消警:'),
          dealSelect('报警升级:'),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Row(
              children: <Widget>[
                Text(
                  '警情级别：',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: (){
                    print('onTap');
                    showPicker(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),//边框
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    width: 230,
                    height: 36,
                    alignment: Alignment.centerRight,

                    child:Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                                _alarmLevel,
                              style: TextStyle(
                                fontSize: 14
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  showPicker(BuildContext context) {
    Picker picker = new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: _alarmLevels,isArray: false),
        changeToFirst: true,
        textAlign: TextAlign.left,
        itemExtent:40,
        height:160,
        cancelText: '取消',
        confirmText: '确定',
        cancelTextStyle: TextStyle(color: Colors.red,fontSize: 17.0),
        confirmTextStyle: TextStyle(color: Colors.blue,fontSize: 17.0),
        selectedTextStyle: TextStyle(color: Colors.black),
        title: Text(
            '警情级别',
            style:TextStyle(
                color:Colors.black,
                fontSize: 18
            )
        ),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          setState(() {

            _alarmLevel = _alarmLevels[value[0]];
          });
        }
    );
    picker.showModal(context);
  }

  Widget dealSelect(String title){

    bool _clearAlarm = false;
    if (title == '是否消警:') {
      _clearAlarm = true;
    }


    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: BoxDecoration(

            ),
            child: Container(
              width: 90,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    if (_clearAlarm) {
                      _noColor = Colors.blue;
                      _yesColor = Colors.white;
                      _noTextColor = Colors.white;
                      _yesTextColor = Colors.black;
                      _isClearAlarm = false;
                    } else {
                      _noColorUpgrade = Colors.blue;
                      _yesColorUpgrade = Colors.white;
                      _noTextColorUpgrade = Colors.white;
                      _yesTextColorUpgrade = Colors.black;
                      _isUpgradeAlarm = false;
                    }
                  });
                },
                child: Text(
                    '否'
                ),
                textColor: _clearAlarm ? _noTextColor : _noTextColorUpgrade,
                color:_clearAlarm ? _noColor:_noColorUpgrade,
//                    disabledColor: Colors.white,
//                    disabledTextColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    side: BorderSide(
                        color: Colors.grey, style: BorderStyle.solid, width: 1)),
                clipBehavior: Clip.antiAlias,
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: BoxDecoration(

            ),
            child: Container(
              width: 90,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    if (_clearAlarm) {
                      _yesColor = Colors.blue;
                      _yesTextColor = Colors.white;
                      _noColor = Colors.white;
                      _noTextColor = Colors.black;
                      _isClearAlarm = true;
                    } else {
                      _yesColorUpgrade = Colors.blue;
                      _yesTextColorUpgrade = Colors.white;
                      _noColorUpgrade = Colors.white;
                      _noTextColorUpgrade = Colors.black;
                      _isUpgradeAlarm = true;
                    }

                  });
                },
                child: Text(
                    '是'
                ),
                textColor: _clearAlarm ? _yesTextColor: _yesTextColorUpgrade,
                color:_clearAlarm ? _yesColor:_yesColorUpgrade,
//                    disabledColor: Colors.white,
//                    disabledTextColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    side: BorderSide(
                        color: Colors.grey, style: BorderStyle.solid, width: 1)),
                clipBehavior: Clip.antiAlias,
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dealResult(BuildContext context) {

    List<String> titles = ['已通知值班人员处理','已通知应急预案领导小组负责人处理','已通知报警机构负责人处理','已向公安机关报案','报告安全保卫负责人处理','远程恢复','远程干预'];
    List<Widget> widgets = [];

    List.generate(titles.length, (index) {
      return widgets.add(checkboxList(titles[index],index));
    });

    return Container(
      margin: EdgeInsets.only(top: 12),
      color: Colors.white,

      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
            alignment:Alignment.centerLeft ,
            child: Text(
              '处置结果：',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight:FontWeight.w500
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Column(
              children: widgets,
          ),
        ),
        ],
      ),
    );

  }

  Widget dealExplanation(BuildContext context){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.fromLTRB(12, 5, 12, 40),
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

  Widget checkboxList(String title, int position) {
    return Container(
      height: 40,
      alignment:Alignment.topCenter,
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16
          ),
        ),
        value: _checkedList[position],
        controlAffinity:ListTileControlAffinity.leading,
        onChanged:(isCheck){
          setState(() {
            _checkedList[position] = isCheck;
          });
        }
      ),
    );
  }


}

