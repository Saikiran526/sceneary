import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/budget/viewmodel/budget_version_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';

class BudgetVersionScreen extends StatelessWidget {
  const BudgetVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => BudgetVersionViewmodel(context: context),
      child: Consumer<BudgetVersionViewmodel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Budget",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      value: viewModel.selectedValue,
                      hint: const Text('Select version'),
                      items: viewModel.items
                          .map(
                            (i) => DropdownMenuItem(value: i, child: Text(i)),
                          )
                          .toList(),
                      onChanged: viewModel.changeValue,
                    ),
                  ),
                ],
              ),
              actions: [
                PopupMenuButton<String>(
                  itemBuilder: (ctx) => viewModel.menuOptions
                      .map((e) => PopupMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onSelected: viewModel.onMenuSelected,
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 1,
            ),

            // body: viewModel.callSheetData.isEmpty
            //     ? const Center(child: CircularProgressIndicator())
            //     : Padding(
            //         padding: EdgeInsets.all(width * 0.05),
            //         child: Column(
            //           children: [
            //             SizedBox(height: height * 0.05),

            //             Expanded(
            //               child: SingleChildScrollView(
            //                 child: Column(
            //                   children: [
            //                     ExpansionTile(
            //                       initiallyExpanded: true,
            //                       tilePadding: const EdgeInsets.symmetric(
            //                         horizontal: 12,
            //                       ),
            //                       title: Text(
            //                         "Pre Production",
            //                         style: GoogleFonts.montserrat(
            //                           fontSize: 14,
            //                           fontWeight: FontWeight.w600,
            //                         ),
            //                       ),
            //                       children: [
            //                         SingleChildScrollView(
            //                           scrollDirection: Axis.horizontal,
            //                           child: SingleChildScrollView(
            //                             scrollDirection: Axis.vertical,
            //                             child: Table(
            //                               border: TableBorder.all(
            //                                 color: Colors.grey,
            //                               ),
            //                               defaultColumnWidth:
            //                                   const FixedColumnWidth(150),
            //                               children: [
            //                                 // HEADER ROW
            //                                 TableRow(
            //                                   decoration: const BoxDecoration(
            //                                     color: Color(0XFFD9D9D9),
            //                                   ),
            //                                   children: [
            //                                     _buildHeaderCell("S/N"),

            //                                     ...viewModel.headers.map(
            //                                       (title) =>
            //                                           _buildHeaderCell(title),
            //                                     ),
            //                                     _buildHeaderCell("Actions"),
            //                                   ],
            //                                 ),

            //                                 ...List.generate(
            //                                   viewModel.callSheetData.length,
            //                                   (rowIndex) {
            //                                     bool showEdit = viewModel
            //                                         .rowHasData(rowIndex);

            //                                     return TableRow(
            //                                       children: [
            //                                         _buildDataCell(
            //                                           "${rowIndex + 1}",
            //                                         ),

            //                                         ...List.generate(
            //                                           viewModel.headers.length,
            //                                           (
            //                                             colIndex,
            //                                           ) => _buildDataCell(
            //                                             viewModel
            //                                                 .callSheetData[rowIndex][colIndex],
            //                                           ),
            //                                         ),

            //                                         Center(
            //                                           child: showEdit
            //                                               ? buildEditButton(
            //                                                   context,
            //                                                   () {
            //                                                     AppRouter
            //                                                         .instance
            //                                                         .push(
            //                                                           RoutePaths
            //                                                               .editCallSheetScreen,
            //                                                         );
            //                                                   },
            //                                                 )
            //                                               : const SizedBox.shrink(),
            //                                         ),
            //                                       ],
            //                                     );
            //                                   },
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),

            //                     ExpansionTile(
            //                       initiallyExpanded: false,
            //                       tilePadding: const EdgeInsets.symmetric(
            //                         horizontal: 12,
            //                       ),
            //                       title: Text(
            //                         "Shooting ",
            //                         style: GoogleFonts.montserrat(
            //                           fontSize: 14,
            //                           fontWeight: FontWeight.w600,
            //                         ),
            //                       ),
            //                       children: [
            //                         SingleChildScrollView(
            //                           scrollDirection: Axis.horizontal,
            //                           child: SingleChildScrollView(
            //                             scrollDirection: Axis.vertical,
            //                             child: Table(
            //                               border: TableBorder.all(
            //                                 color: Colors.grey,
            //                               ),
            //                               defaultColumnWidth:
            //                                   const FixedColumnWidth(150),
            //                               children: [
            //                                 // HEADER ROW
            //                                 TableRow(
            //                                   decoration: const BoxDecoration(
            //                                     color: Color(0XFFD9D9D9),
            //                                   ),
            //                                   children: [
            //                                     ...viewModel.headers.map(
            //                                       (title) =>
            //                                           _buildHeaderCell(title),
            //                                     ),
            //                                   ],
            //                                 ),

            //                                 // EMPTY ROWS (10)
            //                                 ..._buildEmptyRows(viewModel, 10),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            body: viewModel.callSheetData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // PRE PRODUCTION
                              _sectionTile(
                                title: "Pre-Production",
                                child: _budgetTable(
                                  viewModel,
                                  editable: true,
                                  showGroupTotal: true,
                                ),
                              ),

                              // SHOOTING (EMPTY)
                              _sectionTile(
                                title: "Shooting",
                                child: _emptyBudgetTable(viewModel, rows: 10),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // GRAND TOTAL
                      _grandTotalRow(),
                    ],
                  ),
          );
        },
      ),
    );
  }

  /////
  ///
  // Widget _sectionTile({required String title, required Widget child}) {
  //   return ExpansionTile(
  //     initiallyExpanded: true,
  //     tilePadding: const EdgeInsets.symmetric(horizontal: 16),
  //     collapsedBackgroundColor: const Color(0xFF8E2C5A),

  //     backgroundColor: const Color(0xFF8E2C5A),
  //     // backgroundColor: Colors.white,
  //     iconColor: Colors.white,
  //     collapsedIconColor: Colors.white,
  //     title: Text(
  //       title,
  //       style: GoogleFonts.montserrat(
  //         color: Colors.white,
  //         fontWeight: FontWeight.w600,
  //         fontSize: 14,
  //       ),
  //     ),
  //     children: [child],
  //   );
  // }

Widget _sectionTile({required String title, required Widget child}) {
  return ExpansionTile(
    initiallyExpanded: true,
    tilePadding: const EdgeInsets.symmetric(horizontal: 16),
    backgroundColor: Colors.white,
    collapsedBackgroundColor: Colors.white,
    iconColor: Colors.grey.shade600,
    collapsedIconColor: Colors.grey.shade600,
    title: Text(
      title,
      style: GoogleFonts.montserrat(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
    children: [child],
  );
}

  // Widget _budgetTable(
  //   BudgetVersionViewmodel viewModel, {
  //   required bool editable,
  //   bool showGroupTotal = false,
  // }) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Table(
  //       border: TableBorder.all(color: Colors.black54),
  //       defaultColumnWidth: const FixedColumnWidth(150),
  //       children: [
  //         _headerRow(viewModel),

  //         ...List.generate(viewModel.callSheetData.length, (rowIndex) {
  //           final row = viewModel.callSheetData[rowIndex];

  //           return TableRow(
  //             children: List.generate(viewModel.headers.length, (colIndex) {
  //               final value = row[colIndex];

  //               // DEPARTMENT COLUMN WITH EDIT ICON
  //               if (colIndex == 0 && editable) {
  //                 return Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(value, style: const TextStyle(fontSize: 12)),
  //                     const SizedBox(width: 6),
  //                     if (viewModel.rowHasData(rowIndex))
  //                       IconButton(
  //                         icon: const Icon(
  //                           Icons.edit,
  //                           size: 16,
  //                           color: Colors.blue,
  //                         ),
  //                         onPressed: () {
  //                           AppRouter.instance.push(
  //                             RoutePaths.editCallSheetScreen,
  //                           );
  //                         },
  //                       ),
  //                   ],
  //                 );
  //               }

  //               // PERCENTAGE COLUMN
  //               if (viewModel.headers[colIndex] == "Percentage") {
  //                 return Padding(
  //                   padding: const EdgeInsets.all(6),
  //                   child: LinearProgressIndicator(
  //                     value: 0.4,
  //                     backgroundColor: Colors.grey.shade300,
  //                     color: Colors.blue,
  //                   ),
  //                 );
  //               }

  //               return _dataCell(value);
  //             }),
  //           );
  //         }),

  //         if (showGroupTotal) _groupTotalRow(),
  //       ],
  //     ),
  //   );
  // }

Widget _budgetTable(
  BudgetVersionViewmodel viewModel, {
  required bool editable,
  bool showGroupTotal = false,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Table(
      border: TableBorder.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      defaultColumnWidth: const FixedColumnWidth(150),
      children: [
        _headerRow(viewModel),

        ...List.generate(viewModel.callSheetData.length, (rowIndex) {
          final row = viewModel.callSheetData[rowIndex];

          return TableRow(
            children: List.generate(viewModel.headers.length, (colIndex) {
              final value = row[colIndex];

              // Department column with edit icon
              if (colIndex == 0 && editable) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (viewModel.rowHasData(rowIndex))
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {
                          AppRouter.instance.push(
                            RoutePaths.editCallSheetScreen,
                          );
                        },
                      ),
                  ],
                );
              }

              // Percentage column (wireframe)
              if (viewModel.headers[colIndex] == "Percentage") {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: LinearProgressIndicator(
                    value: 0.4,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.grey.shade500,
                  ),
                );
              }

              return _dataCell(value);
            }),
          );
        }),

        if (showGroupTotal) _groupTotalRow(),
      ],
    ),
  );
}

  // Widget _emptyBudgetTable(BudgetVersionViewmodel viewModel, {int rows = 10}) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Table(
  //       border: TableBorder.all(color: Colors.black54),
  //       defaultColumnWidth: const FixedColumnWidth(150),
  //       children: [
  //         _headerRow(viewModel),
  //         ...List.generate(
  //           rows,
  //           (_) => TableRow(
  //             children: List.generate(
  //               viewModel.headers.length,
  //               (_) => _dataCell(""),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _emptyBudgetTable(BudgetVersionViewmodel viewModel, {int rows = 10}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Table(
      border: TableBorder.all(
        color: Colors.grey.shade400,
        width: 1,
      ),
      defaultColumnWidth: const FixedColumnWidth(150),
      children: [
        _headerRow(viewModel),
        ...List.generate(
          rows,
          (_) => TableRow(
            children: List.generate(
              viewModel.headers.length,
              (_) => _dataCell(""),
            ),
          ),
        ),
      ],
    ),
  );
}


  // TableRow _headerRow(BudgetVersionViewmodel viewModel) {
  //   return TableRow(
  //     decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
  //     children: viewModel.headers.map((h) => _headerCell(h)).toList(),
  //   );
  // }
  TableRow _headerRow(BudgetVersionViewmodel viewModel) {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
    ),
    children: viewModel.headers
        .map((h) => _headerCell(h))
        .toList(),
  );
}


  // Widget _headerCell(String text) {
  //   return Container(
  //     height: 45,
  //     alignment: Alignment.center,
  //     child: Text(
  //       text,
  //       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }
  Widget _headerCell(String text) {
  return Container(
    height: 45,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.grey.shade800,
      ),
      textAlign: TextAlign.center,
    ),
  );
}


  // Widget _dataCell(String value) {
  //   return Container(
  //     height: 40,
  //     alignment: Alignment.center,
  //     child: Text(
  //       value,
  //       style: const TextStyle(fontSize: 12),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }
  Widget _dataCell(String value) {
  return Container(
    height: 40,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Text(
      value,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey.shade700,
      ),
      textAlign: TextAlign.center,
    ),
  );
}


  // TableRow _groupTotalRow() {
  //   return TableRow(
  //     decoration: const BoxDecoration(color: Color(0xFFF3C1D9)),
  //     children: List.generate(
  //       15,
  //       (index) => index == 6
  //           ? const Center(
  //               child: Text(
  //                 "30,000",
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //             )
  //           : index == 0
  //           ? const Center(
  //               child: Text(
  //                 "Group Total",
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //             )
  //           : const SizedBox.shrink(),
  //     ),
  //   );
  // }
  TableRow _groupTotalRow() {
  return TableRow(
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
    ),
    children: List.generate(
      15,
      (index) => index == 0
          ? Center(
              child: Text(
                "Group Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            )
          : index == 6
              ? Center(
                  child: Text(
                    "30,000",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
    ),
  );
}


  // Widget _grandTotalRow() {
  //   return Container(
  //     // color: const Color(0xFFD46BA7),
  //     color: Colors.white,
  //     padding: const EdgeInsets.all(14),
  //     child: Row(
  //       children: const [
  //         Expanded(
  //           child: Text(
  //             "Grand Total",
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         Text("₹ 30,000", style: TextStyle(fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }
  Widget _grandTotalRow() {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.grey.shade400),
      ),
    ),
    child: Row(
      children: [
        Text(
          "Grand Total",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const Spacer(),
        Text(
          "₹ 30,000",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    ),
  );
}


  ///
  ///
  ///

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

  List<TableRow> _buildEmptyRows(
    BudgetVersionViewmodel viewModel,
    int rowCount,
  ) {
    return List.generate(rowCount, (rowIndex) {
      return TableRow(
        children: List.generate(
          viewModel.headers.length,
          (_) => _buildDataCell(""),
        ),
      );
    });
  }
}
