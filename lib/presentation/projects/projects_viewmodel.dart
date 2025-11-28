import 'package:flutter/cupertino.dart';

class ProjectsViewmodel extends ChangeNotifier{

  // State
  final Map<String,String> _projectDetails={
    "productionType":"Pre-production",
    "movie":"Animal",
    "Director" : "Sandeep Reddy",
    "Producer" : "Ajay Kumar",
    "Duration" : "Apr 12, 2025 – Aug 30, 2026",
    "Budget" : "10 Cr",
  };
  // final Map<String,String> _projectDetails={};

  // Getters
  Map<String,String> get projectDetails=>_projectDetails;

}