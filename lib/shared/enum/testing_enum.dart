import 'package:flutter/material.dart';

enum EventStatus {
  holiday,
  yourLeave,
  teamLeave;

  static EventStatus map(String? type) {
    switch (type) {
      case 'Holiday':
        return EventStatus.holiday;
      case 'YourLeave':
        return EventStatus.yourLeave;
      case 'TeamLeave':
        return EventStatus.teamLeave;
      default:
        return EventStatus.yourLeave;
    }
  }

  Color get color {
    switch (this) {
      case EventStatus.holiday:
        return Colors.purple;
      case EventStatus.yourLeave:
        return Colors.green;
      case EventStatus.teamLeave:
        return Colors.orange;
      default:
        return Colors.purple;
    }
  }
}
