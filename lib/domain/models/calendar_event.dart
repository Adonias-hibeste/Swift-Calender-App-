import 'package:flutter/material.dart';

class CalendarEvent {
  final String id;
  final String title;
  final DateTime startTime;
  final Duration duration;
  final String location;
  final Color categoryColor;
  final String categoryLabel;
  final List<String> participants;
  final String notes;

  CalendarEvent({
    required this.id,
    required this.title,
    required this.startTime,
    required this.duration,
    this.location = '',
    this.categoryColor = Colors.blue,
    this.categoryLabel = 'Work',
    this.participants = const [],
    this.notes = '',
  });

  String get timeRange {
    final endTime = startTime.add(duration);
    return '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')} - ${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}';
  }
}
