import 'package:flutter/material.dart';
import 'mainPageContents/compass.dart';
import 'mainPageContents/schedule.dart';
import 'mainPageContents/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _currentPage = 0;
  final _pages = <Widget>[
    Compass(),
    Schedule(),
    Settings()
  ];
  final _pageNames = <String>[
    'Kiblat',
    'Jadwal Sholat',
    'Pengaturan'
  ];
  PageStorageBucket _pageStorageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      appBar: AppBar(
        title: Text(_pageNames[_currentPage]),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageStorage(
        bucket: _pageStorageBucket,
        child: _pages[_currentPage],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        elevation: 0,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 14,
                offset: Offset(0, -4),
                color: Color(0x1A000000),
              )
            ],
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(22),
                color: _currentPage == 0 ? Color(0xFF70DA6E) : Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    setState(() {
                      _currentPage = 0;
                    });
                  },
                  child: Container(
                    height: 44,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/fa-solid_compass.svg',
                          semanticsLabel: 'CompassIcon',
                          height: 24,
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          vsync: this,
                          child: Container(
                            height: MediaQuery.of(context).size.width,
                            margin: _currentPage == 0 ? EdgeInsets.only(left: 10) : null,
                            alignment: Alignment.center,
                            child: Text(
                              (_currentPage == 0 ? 'Kiblat' : ''),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(22),
                color: _currentPage == 1 ? Color(0xFF70DA6E) : Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    setState(() {
                      _currentPage = 1;
                    });
                  },
                  child: Container(
                    height: 44,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/fa-solid_mosque.svg',
                          semanticsLabel: 'Mosque',
                          height: 24,
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          vsync: this,
                          child: Container(
                            height: MediaQuery.of(context).size.width,
                            margin: _currentPage == 1 ? EdgeInsets.only(left: 10) : null,
                            alignment: Alignment.center,
                            child: Text(
                              (_currentPage == 1 ? 'Jadwal' : ''),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            )
                          ),
                        )
                      ],
                    )
                  ),
                )
              ),
              Material(
                borderRadius: BorderRadius.circular(22),
                color: _currentPage == 2 ? Color(0xFF70DA6E) : Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    setState(() {
                      _currentPage = 2;
                    });
                  },
                  child: Container(
                    height: 44,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/fa-solid_cog.svg',
                          semanticsLabel: 'Cog',
                          height: 24,
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          vsync: this,
                          child: Container(
                            height: MediaQuery.of(context).size.width,
                            margin: _currentPage == 2 ? EdgeInsets.only(left: 10) : null,
                            alignment: Alignment.center,
                            child: Text(
                              (_currentPage == 2 ? 'Pengaturan' : ''),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  )
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}