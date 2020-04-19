import 'package:flutter/material.dart';

class SettingsItem {
  String mode;
  String itemName;
  Image leftIcon;
  bool isRightOn;
  Function(BuildContext context) onClick;

  static const MODE_RIGHT = 'MODE RIGHT';
  static const MODE_LEFT = 'MODE LEFT';
  static const MODE_BOTH = 'MODE BOTH';
  static const MODE_RIGHT_SWITCH = 'MODE RIGHT SWITCH';

  SettingsItem({this.itemName, this.mode, this.onClick});

  void setLeftIcon(Image leftIcon) {
    this.leftIcon = leftIcon;
  }

  void setRightOn(bool isRightOn) {
    this.isRightOn = isRightOn;
  }
}
