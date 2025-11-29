import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectInformationViewmodel extends ChangeNotifier {
  final BuildContext context;
  ProjectInformationViewmodel({
    required this.context
  });
  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController productionBannerController = TextEditingController();
  final TextEditingController projectTypeController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController producerNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController estimatedController = TextEditingController();
   final TextEditingController genereController = TextEditingController();
    final TextEditingController languageController = TextEditingController();
     final TextEditingController discriptionController = TextEditingController();

Future<void> selectStartDate() async {
  DateTime? picked =  await showDatePicker(
    context: context,
     firstDate: DateTime(1990), 
     lastDate: DateTime(2100),
     initialDate: DateTime.now());
     if (picked != null){
      startDateController.text = DateFormat('dd/MM/yyyy').format(picked);
     }
}

Future<void> selectEndDate() async {
  DateTime? picked =  await showDatePicker(
    context: context,
     firstDate: DateTime(1990), 
     lastDate: DateTime(2100),
     initialDate: DateTime.now());
     if (picked != null){
      endDateController.text = DateFormat('dd/MM/yyyy').format(picked);
     }
}



}