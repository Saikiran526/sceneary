import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/call_sheet_table_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class CallSheetTableScreen extends StatelessWidget {
  const CallSheetTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CallSheetTableViewmodel(context: context),
      child: Consumer<CallSheetTableViewmodel>(
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
              title: Text(
                "Call Sheet",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
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

            body: viewModel.callSheetData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
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
                                    borderColor: Colors.transparent,

                                    onTap: () {},
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
                                    onTap: () {
                                      viewModel.showDownloadedSuccess(context);
                                    },
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
                                  borderWidth: 1,
                                  borderColor: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.inter().fontFamily,

                                  label: "Upload Call Sheet",
                                  onTap: () {},
                                  textColor: Colors.black,
                                  buttonColor: Colors.white,
                                  icon: AssetsPath.downloadImg,
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.05),

                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Table(
                                border: TableBorder.all(color: Colors.grey),
                                defaultColumnWidth: const FixedColumnWidth(150),
                                children: [
                                  // HEADER ROW
                                  TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color(0XFFD9D9D9),
                                    ),
                                    children: [
                                      _buildHeaderCell("S/N"),
                                      ...viewModel.headers.map(
                                        (title) => _buildHeaderCell(title),
                                      ),
                                      _buildHeaderCell("Actions"),
                                    ],
                                  ),

                                  // DATA ROWS
                                  ...List.generate(
                                    viewModel.callSheetData.length,
                                    (rowIndex) {
                                      bool showEdit = viewModel.rowHasData(
                                        rowIndex,
                                      );

                                      return TableRow(
                                        children: [
                                          _buildDataCell("${rowIndex + 1}"),

                                          ...List.generate(
                                            viewModel.headers.length,
                                            (colIndex) => _buildDataCell(
                                              viewModel
                                                  .callSheetData[rowIndex][colIndex],
                                            ),
                                          ),

                                          Center(
                                            child: showEdit
                                                ? buildEditButton(context, () {
                                                    AppRouter.instance.push(
                                                      RoutePaths
                                                          .editCallSheetScreen,
                                                    );
                                                  })
                                                : const SizedBox.shrink(),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
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

  Widget _buildHeaderCell(String text) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String value) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildEditButton(BuildContext context, VoidCallback onPressed) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final buttonHeight = height * 0.03;
    final fontSize = width * 0.03;
    final iconSize = width * 0.03;
    final padding = width * 0.01;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 0,
        maxWidth: double.infinity,
        minHeight: buttonHeight,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.edit, size: iconSize, color: Colors.white),
        label: Text(
          "Edit",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: Colors.white,
            height: 1.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: padding),
          backgroundColor: const Color(0xFF252525),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          minimumSize: Size(0, buttonHeight),
        ),
      ),
    );
  }
}
