import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/model/alarm_entity.dart';
import 'package:flutter_learn/hy/pages/deal_alarm_page.dart';
import 'package:flutter_learn/hy/pages/error_alarm_page.dart';
import 'package:flutter_learn/hy/utils/util.dart';

class EventDetailPage extends StatelessWidget {

  static const routeName="/eventDetail";

  AlarmDataACsV alarmDataACsV;

  List _InfoContents = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.getAppBar(context, '事件详情'),
      body: Container(
        child: _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    alarmDataACsV = ModalRoute.of(context).settings.arguments;
    List<AlarmDataACsVOriginalEventAssociatedDevice> associatedDevices  = alarmDataACsV.originalEvent.associatedDevices;
    List <AlarmDataACsVAction>actions = alarmDataACsV.actions;

    List<Widget> widgets = [];
    widgets.add(_alarmInfoWidget(context, alarmDataACsV));

    if (associatedDevices.length > 0) {
      widgets.add(_videoWidget(context, alarmDataACsV));
    }

    if (actions.length > 0) {
      widgets.add(_pictureWidget(context, actions));
    }

    widgets.add(_dealWidget(context));

    return ListView(
      children: widgets
    );
  }

  Widget _videoSubWidget (BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      height: 240,
      child: Text(
        '视频播放'
      ),
    );
  }

  Widget _videoWidget(BuildContext context, AlarmDataACsV alarmDataACsV ) {
    AlarmDataACsV alarmDataACsV = ModalRoute.of(context).settings.arguments;
    List<AlarmDataACsVOriginalEventAssociatedDevice> associatedDevices  = alarmDataACsV.originalEvent.associatedDevices;
    List<Widget> widgets = [];
    associatedDevices.forEach((DeviceCode) {
      widgets.add(_videoSubWidget(context));
    });

    return ExpansionTile(
        children: widgets,
        initiallyExpanded:true,
        leading:Icon(
            Icons.insert_drive_file
        ),
        trailing: Icon(
            Icons.arrow_drop_down_circle
        ),

        title: Text(
          '联动视频',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget _pictureWidget(BuildContext context, List <AlarmDataACsVAction> actions) {

    List<Widget> widgets = [];
    actions.forEach((id) {
      widgets.add(_videoSubWidget(context));
    });

    return ExpansionTile(
        children: widgets,
        initiallyExpanded:true,
        leading:Icon(
            Icons.insert_drive_file
        ),
        trailing: Icon(
            Icons.arrow_drop_down_circle
        ),

        title: Text(
          '联动视频',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget _pictureSubWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      height: 240,
      child: Image(

      ),
    );
  }

  Widget _alarmInfoWidget(BuildContext context, AlarmDataACsV alarmDataACsV) {

    int eventLevel = alarmDataACsV.originalEvent.eventLevel;
    String alarmLevel = '';
    String point = '';
    String eventTypeName = alarmDataACsV.originalEvent.eventLevelName;
    String alarmDevice = alarmDataACsV.originalEvent.listEventSource[0].intactInfo.devcieName;
    String organization = alarmDataACsV.originalEvent.listEventSource[0].organization;
    String recvTime = alarmDataACsV.originalEvent.listEventSource[0].recvTime;
    String alarmArea = '';
    String eventName = '';

    switch (eventLevel) {
      case 1:
        {
          alarmLevel = '一级';
        }
        break;
      case 2:
        {
          alarmLevel = '二级';
        }
        break;
      case 3:
        {
          alarmLevel = '三级';
        }
        break;
      case 4:
        {
          alarmLevel = '四级';
        }
        break;
    }

    Map<String, String> infos = {
      '事件名称： ':eventName,
      '机      构： ':organization,
      '报警区域： ':alarmArea,
      '点   位：  ':point,
      '报警设备： ':alarmDevice,
      '事件类型： ':eventTypeName,
      '发生时间： ':recvTime,
      '警情级别： ':alarmLevel,
    };

    List<Widget> widgets = [];
    infos.keys.forEach((key) {
      widgets.add(_item(key, infos[key]));
    });

    return Container(
      child: ExpansionTile(
          children: widgets,
          initiallyExpanded:true,
          leading:Icon(
            Icons.insert_drive_file
          ),
        trailing: Icon(
            Icons.arrow_drop_down_circle
          ),

          title: Text(
            '报警信息',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }


  Widget _item(String title, String content) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          decoration:BoxDecoration(
                border:Border(
                  top: BorderSide(
                      color: Colors.grey[400],width: (title == '警情级别')?0.0:1.0,
                  ),
//                  top: BorderSide(
//                    color: Colors.grey[400],width:(title == '事件名称')?2.0:0.0,
//                  )
                )
            ),
        margin: EdgeInsets.fromLTRB(16, 0, 10, 0),
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54
                ),
              ),
              Divider(
                color: Colors.grey,
              )
            ],
        ),
      ),
    );
  }

  Widget _dealWidget(BuildContext context) {

    List alarmDeals = [{'真实报警':'alarm_real.png'},{'误报':'alarm_error.png'},{'测试':'alarm_test.png'},{'故障':'alarm_fault.png'}];


    List<Widget> widgets = [];

    List.generate(alarmDeals.length, (index){
      Map<String, String> map = alarmDeals[index];
      return map.keys.forEach((key){
        widgets.add(_dealItem(context,key, map[key]));;
      });
    });

    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceAround ,
        children: widgets,
      ),
    );
  }

  _dealItem(BuildContext context,String name, String picturePath){
    return GestureDetector(
      onTap: (){
        if (name == '真实报警') {
          Navigator.of(context).pushNamed(DealAlarmPage.routeName, arguments:alarmDataACsV);
        } else {
          Map arguments = {'title':name,'data':alarmDataACsV};
          Navigator.of(context).pushNamed(ErrorAlarmPage.routeName, arguments:arguments);
        }

      },
      child: Column(
        children: <Widget>[
          Image(image: AssetImage("assets/images/$picturePath"),width: 28,height: 28,),
          Container(
            margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: Text(
              name,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),

    );
  }

}
