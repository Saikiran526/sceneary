import 'package:flutter/material.dart';

class AvailabilityModel {
  final TimeOfDay fromTime;
  final TimeOfDay toTime;
  final String availability;
  final String reason;

  AvailabilityModel({
    required this.fromTime,
    required this.toTime,
    required this.availability,
    required this.reason,
  });
}
