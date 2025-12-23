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
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Call Sheet",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Manage and Send call sheets to cast and crew.',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () => servicePopUpMenu(context),
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: "Create Call Sheet",
                              buttonColor: Color(0XFF1D55A8),
                              textColor: Color(0XFFF6F6F6),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              icon: AssetsPath.addImg,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              borderWidth: 1,
                              borderColor:
                                  Colors.transparent, // for first button

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
                              fontSize: 14,
                              borderWidth: 1,
                              borderColor: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.inter().fontFamily,

                              label: "Download Template",
                              onTap: () { viewModel.showDownloadedSuccess(context);},
                              buttonColor: Colors.white,
                              textColor: Color(0XFF252525),
                              icon: AssetsPath.downloadImg,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppButton(
                            width: 180,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.inter().fontFamily,
                            textColor: Color(0XFF252525),

                            label: "Upload Call Sheet",
                            onTap: () {
                              AppRouter.instance.push(
                                RoutePaths.callSheetTableSceen,
                              );
                            },
                            borderColor: Colors.black,
                            buttonColor: Colors.white,
                            icon: AssetsPath.downloadImg,
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
                      color: Color(0XFFF9EAF5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      'No entries are scheduled. Add your first shooting schedule or upload an Excel file.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF7D7D7D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: SvgPicture.asset(
                        AssetsPath.callSheetsBg,
                        width: width * 0.6,
                        fit: BoxFit.contain,
                      ),
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
