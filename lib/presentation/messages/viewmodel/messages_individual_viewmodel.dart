import 'package:flutter/material.dart';

class MessagesIndividualViewmodel extends ChangeNotifier{
  final BuildContext context;

  MessagesIndividualViewmodel({
    required this.context
  });
  final TextEditingController searchController = TextEditingController();
}