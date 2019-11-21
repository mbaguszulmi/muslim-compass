import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:muslimcompass/model/schedule_item.dart';

class Schedule extends StatefulWidget {

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _currentTime = DateTime.now();
  DateTime _todayDate;
  DateTime _currentDate;
  DateFormat _formatDate = DateFormat("d MMMM yyyy");
  TextStyle _cardMainTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16
  );
  List<ScheduleItem> _scheduleList = [
    ScheduleItem(scheduleName: 'Imsak', scheduleTime: DateTime.parse("20191121T032900")),
    ScheduleItem(scheduleName: 'Subuh', scheduleTime: DateTime.parse("20191121T033900")),
    ScheduleItem(scheduleName: 'Terbit', scheduleTime: DateTime.parse("20191121T045800")),
    ScheduleItem(scheduleName: 'Dhuha', scheduleTime: DateTime.parse("20191121T052600")),
    ScheduleItem(scheduleName: 'Dzuhur', scheduleTime: DateTime.parse("20191121T111800")),
    ScheduleItem(scheduleName: 'Ashar', scheduleTime: DateTime.parse("20191121T144000")),
    ScheduleItem(scheduleName: 'Maghrib', scheduleTime: DateTime.parse("20191121T173200")),
    ScheduleItem(scheduleName: 'Isya', scheduleTime: DateTime.parse("20191121T184600")),
  ];

  @override
  void initState() {
    DateFormat dateFormat = DateFormat("yyyyMMdd");
    _todayDate = DateTime.parse("${dateFormat.format(_currentTime)}T000000");
    _currentDate = _todayDate;
    print("today = $_todayDate");

    for (var i = 0; i < _scheduleList.length; i++) {
      ScheduleItem item = _scheduleList[i];
      if (item.scheduleTime.millisecondsSinceEpoch <= _currentTime.millisecondsSinceEpoch) {
        item.isActive = true;
        item.willActive = false;

        if (i > 0) {
          _scheduleList[i-1].isActive = false;
          _scheduleList[i-1].willActive = false;
        }

        if (i < _scheduleList.length-1) {
          _scheduleList[i+1].isActive = false;
          _scheduleList[i+1].willActive = true;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20, 9, 20, 9),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFECECEC),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () async {
                DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _currentDate,
                  firstDate: DateTime(1996),
                  lastDate: DateTime(2030)
                );

                if (pickedDate != null && pickedDate != _currentDate) {
                  setState(() {
                    _currentDate = pickedDate;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _formatDate.format(_currentDate),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2F2F2F)
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/mdi-calendar-month-outline.svg',
                      semanticsLabel: 'Calendar',
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              (_todayDate.difference(_currentDate).inDays == 0) ? Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Waktu saat ini',
                  style: TextStyle(
                    fontSize: 26,
                  )
                ),
              ) : Container(),
              (_todayDate.difference(_currentDate).inDays == 0) ? Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow> [
                    BoxShadow(
                      blurRadius: 14,
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.1)
                    )
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        'assets/illustrations/IllustrationImsak.svg',
                        semanticsLabel: 'Illustrations',
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.width * 190.67 / 371,
                      ),
                    ),
                    // Card content
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/icons/mdi-clipboard-list-outline.svg',
                                      semanticsLabel: 'Clipboard',
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Imsak',
                                      style: _cardMainTextStyle,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/icons/mdi-timer-sand.svg',
                                      semanticsLabel: 'TimerSand',
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '8 menit',
                                      style: _cardMainTextStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/mdi-clock-outline.svg',
                                  semanticsLabel: 'TimerSand',
                                  width: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '03:31',
                                  style: _cardMainTextStyle,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ) : Container(),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Semua waktu',
                  style: TextStyle(
                    fontSize: 26,
                  )
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _scheduleList.length,
                itemBuilder: (BuildContext context, int index) {
                  ScheduleItem item = _scheduleList[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: (item.isActive) ? Border.all(
                        width: 2,
                        color: Colors.green,
                      ) :
                      (item.willActive) ? Border.all(
                        width: 2,
                        color: Colors.orange,
                      ) : null,
                      boxShadow: <BoxShadow> [
                        BoxShadow(
                          blurRadius: 15,
                          offset: Offset(0, 4),
                          color: Color.fromRGBO(0, 0, 0, 0.1)
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/icons/mdi-clipboard-list-outline.svg',
                                    semanticsLabel: 'Clipboard',
                                    width: 24,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${item.scheduleName}',
                                    style: _cardMainTextStyle,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '3 menit tersisa',
                                    style:TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Color(0xFF656565)
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/mdi-clock-outline.svg',
                                semanticsLabel: 'TimerSand',
                                width: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${item.getTimeStr()}',
                                style: _cardMainTextStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        )
      )
    );
  }
}