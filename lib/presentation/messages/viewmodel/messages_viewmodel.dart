import 'package:flutter/material.dart';

class MessagesViewmodel extends ChangeNotifier{
  final BuildContext context;
  MessagesViewmodel({
    required this.context
  });
  final TextEditingController searchController = TextEditingController();
}