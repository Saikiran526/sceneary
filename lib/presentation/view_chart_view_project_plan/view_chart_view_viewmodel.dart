import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class ViewChartViewViewmodel extends ChangeNotifier {
  final BuildContext context;

  ViewChartViewViewmodel({required this.context});

  String selectPhase = 'All';
  String selectView = 'Monthly';
  String selectStatus = 'All';

  List<String> choosePhase = ["All", "First Phase", "Second Phase"];
  List<String> chooseView = ["Monthly", "Weekly", "Yearly", "Daily"];
  List<String> chooseStatus = ["All", "On going", "Completed", "Pending"];

  Future<void> showFilterDailog() async {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            AssetsPath.closeCircle,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 6),
                    Text(
                      'Phase',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 328,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0x33000000),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(8),
                          value: selectPhase,
                          items: choosePhase
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState() {
                              selectPhase = value!;
                            }
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'view',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 328,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0x33000000),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(8),
                          value: selectView,
                          items: chooseView
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState() {
                              selectView = value!;
                            }
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 328,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0x33000000),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(8),
                          value: selectStatus,
                          items: chooseStatus
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState() {
                              selectStatus = value!;
                            }
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: primaryButton(text: 'Save', onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showPopMoreVert() {
  showMenu<String>(
    context: context,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    position: const RelativeRect.fromLTRB(10, 80, 0, 30),

    items: [
      PopupMenuItem<String>(
        value: "addManually",
        child: Center(
          child: Text(
            "Add Manually",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),

      const PopupMenuDivider(height: 1),

      PopupMenuItem<String>(
        value: "downloadSheet",
        child: Center(
          child: Text(
            "Download Sheet",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),

      const PopupMenuDivider(height: 1),

      PopupMenuItem<String>(
        value: "uploadSheet",
        child: Center(
          child: Text(
            "Upload Sheet",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ],
  ).then((value) {
    if (value == null) return;
    if (value == "addManually") {
      AppRouter.instance.push(RoutePaths.createTaskScreen);
     } else if (value == "downloadSheet") {
     } else if (value == "uploadSheet") {
     }
  });
}

}
