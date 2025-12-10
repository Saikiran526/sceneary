import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/call_sheet_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class CallSheetScreen extends StatelessWidget {
  const CallSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CallSheetViewmodel(context: context),
      child: Consumer<CallSheetViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Call Sheet",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => servicePopUpMenu(context),
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(AssetsPath.menuImg),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Manage and Send call sheets to cast and crew.',
                    style: TextStyle(
                      fontSize: width * 0.032,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff787878),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: "Create Call Sheet",
                              buttonColor: Colors.black,
                              textColor: Colors.white,
                              icon: AssetsPath.addImg,
                              onTap: () {
                                AppRouter.instance.push(
                                  RoutePaths.createCallSheetScreen,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: AppButton(
                              label: "Download Template",
                              onTap: () {},
                              buttonColor: Colors.white,
                              textColor: Colors.black,
                              borderColor: Colors.black,
                              icon: AssetsPath.downloadImg,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: "Upload Call Sheet",
                              onTap: () {
                                AppRouter.instance.push(
                                  RoutePaths.callSheetTableSceen,
                                );
                              },
                              borderColor: Colors.black,
                              textColor: Colors.black,
                              buttonColor: Colors.white,
                              icon: AssetsPath.downloadImg,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.05),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.04,
                      horizontal: width * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      'No entries are scheduled. Add your first shooting schedule or upload an Excel file.',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff787878),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
