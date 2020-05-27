import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:flutter_learn/hy/model/alarm_entity.dart';
import 'package:flutter_learn/hy/model/event_level_entity.dart';
import 'package:flutter_learn/hy/model/event_level_number_entity.dart';
import 'package:flutter_learn/hy/pages/event_detail_page.dart';
import 'package:flutter_learn/hy/widget/webview_widget.dart';
import 'package:flutter_learn/hy/utils/GlobalConfig.dart';

class AlarmPage extends StatelessWidget {

  static const routeName="/alarmPage";

  final _tabs = ['未处置', '已处置'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '报警管理',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Material(
              color: Colors.white,
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                  labelColor: GlobalConfig.colorPrimary,
                  tabs: _tabs.map((String name) => Container(
                  color: Colors.white,
              height:40,
              alignment: Alignment.center,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 5.0),
                )).toList(),

              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            UntreatedAlarmPage(),
            MyWebView(Api.FC_Web_BJGL_BG_0001),

          ],
//
        )
      ),
    );
  }
}

class UntreatedAlarmPage extends StatefulWidget {
  @override
  _UntreatedAlarmPageState createState() => _UntreatedAlarmPageState();
}

class _UntreatedAlarmPageState extends State<UntreatedAlarmPage> {
  ScrollController _controller = new ScrollController();
  List<AlarmDataACsV> _alarmItems = [];
  List<String> _eventLevels = [];
  List<EventLevelData>  _eventLevelDatas = [];

  var _mPage = 0;
  var selectItemValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _alarmRuleInfoArray();
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        //如果不是最后一页数据，则生成新的数据添加到list里面
        if(_mPage < 4){
          _retrieveData();
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    Map<String, EventLevelData> map = {};
    List.generate(_eventLevelDatas.length, (index){
      EventLevelData eventLevelData = _eventLevelDatas[index];
      map[eventLevelData.eventLevel] = eventLevelData;
    });
    
    return Column(
      children: <Widget>[
        levelSelect(_eventLevels),
        Expanded(
          child: ListView.separated(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              AlarmDataACsV alarmDataACsV = _alarmItems[index];
              return _item(alarmDataACsV,map);
            },
              //分割线构造器
              separatorBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: new Divider(color:
                  Colors.grey,),
                );
              },
              //_items.length + 1是为了给最后一行的加载loading留出位置
            itemCount: _alarmItems.length
          ),
        )
      ],
    );
  }

  _item(AlarmDataACsV alarmDataACsV, Map<String, EventLevelData> map) {

    int eventLevel = alarmDataACsV.originalEvent.eventLevel;
    String eventTypeName = alarmDataACsV.originalEvent.eventLevelName;
    String deviceName = alarmDataACsV.originalEvent.listEventSource[0].intactInfo.devcieName;
    String organization = alarmDataACsV.originalEvent.listEventSource[0].organization;
    String recvTime = alarmDataACsV.originalEvent.listEventSource[0].recvTime;

    EventLevelData eventLevelData = map['$eventLevel'];

    Color color = Color(int.parse(eventLevelData.imageColor.replaceRange(0, 1, '0x')));

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(EventDetailPage.routeName, arguments:alarmDataACsV);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 4, 0, 0),
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                      color: color,
                  ),
                    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    margin: EdgeInsets.only(right: 8),
                    child: Center(
                      child: Text(
                        eventLevelData.eventLevelName.substring(0,2),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),
                  Text(
                    eventTypeName,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                alignment: Alignment.centerLeft,
                child: Text(
                   deviceName,
                      style: TextStyle(
                      )
                ),
              ),

              Row(
                children: <Widget>[
                  Text(
                      '所属机构'
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                          recvTime
                      ),
                    ),
                  )
                ],

              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getAllData() async {
     CommonService.getAlarmList(
        onSuccess:(AlarmEntity alarmEntity) {
          setState(() {

            _alarmItems = alarmEntity.data.aCs[0].v;
          });
        },
      onError: (String error) {
          print(error);
      }
    );
  }

  void _alarmRuleInfoArray() {
    CommonService.alarmRuleInfoArray(
        onSuccess:(EventLevelEntity eventLevelEntity) {
          _eventLevelDatas  = eventLevelEntity.data;
          List<Map> levels = [];
          List.generate(_eventLevelDatas.length, (index){
            EventLevelData eventLevelData  = _eventLevelDatas[index];
            levels.add({'EventLevel':eventLevelData.eventLevel});
          });
          _alarmLevelNumber(levels);
        },
        onError: (String error) {
          print(error);
        }
    );
  }

  void _alarmLevelNumber(List<Map> levels) {
    CommonService.alarmLevelNumber(levels,
        onSuccess:(EventLevelNumberEntity eventLevelNumberEntity) {
          List<EventLevelNumberDataACsV> eventLevelNumberDataACsVs = eventLevelNumberEntity.data.aCs[0].v;
          List.generate(_eventLevelDatas.length, (index){
            EventLevelData eventLevelData  = _eventLevelDatas[index];
            String eventLevelName = eventLevelData.eventLevelName;
            EventLevelNumberDataACsV numberData = eventLevelNumberDataACsVs[index];
            int number = numberData.count;
            _eventLevels.add('$eventLevelName'+' ($number)');
          });
          _getAllData();
        },
        onError: (String error) {
          print(error);
        }
    );
  }

  void _getSomeLevelAlarmData(Map eventLevel) {
    CommonService.someLevelAlarmData(eventLevel,
        onSuccess:(AlarmEntity alarmEntity) {
          setState(() {
            _alarmItems = alarmEntity.data.aCs[0].v;
          });
        },
        onError: (String error) {
          print(error);
        }
    );
  }

  void _retrieveData() {
    _mPage++;
    //TODO：get more data

  }

  @override
  void dispose() {
    //移除监听，防止内存泄漏
    _controller.dispose();
    super.dispose();
  }

  Widget levelSelect(List<String> titles) {
    return  DropdownButtonHideUnderline(
      child:  Container(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
            border: Border(bottom:BorderSide(color: Color(0xfff2f2f2),width: 10) )
        ),
        child: DropdownButton(
          hint:  Text(
            '全部级别',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          isExpanded:true,
          //设置这个value之后,选中对应位置的item，
          //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
          value: selectItemValue,
          items: generateItemList(titles),
          onChanged: (T){
            setState(() {
              selectItemValue = T;
              if (selectItemValue == '全部等级') {
                _getAllData();
              } else {
                _getSomeLevelAlarmData({'EventLevel':selectItemValue});
              }
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem> generateItemList(List<String> titles) {

    if (titles.length == 0) return null;

    List<DropdownMenuItem> items =  List();

    items.add(DropdownMenuItem(
        value: '全部等级', child:  Text('全部等级')));

    List.generate(titles.length, (index){

      EventLevelData eventLevelData = _eventLevelDatas[index];
      return items.add(DropdownMenuItem(
          value: eventLevelData.eventLevel, child:  Text(titles[index])));
    });

    return items;

  }
}