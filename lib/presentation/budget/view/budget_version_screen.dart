import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/budget/viewmodel/budget_version_viewmodel.dart';

class BudgetVersionScreen extends StatelessWidget {
  const BudgetVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BudgetVersionViewmodel(context: context),
      child: Consumer<BudgetVersionViewmodel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: Row(
                children: [
                  Text(
                    "Budget",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      value: viewModel.selectedValue,
                      hint: const Text("Select version"),
                      items: viewModel.items
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: viewModel.changeValue,
                    ),
                  ),
                ],
              ),
              actions: [
                PopupMenuButton<String>(
                  itemBuilder: (_) => viewModel.menuOptions
                      .map((e) => PopupMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onSelected: viewModel.onMenuSelected,
                ),
              ],
            ),

            body: viewModel.callSheetData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _sectionTile(
                                title: "Pre-Production",
                                child: _budgetTable(
                                  viewModel,
                                  editable: true,
                                  showGroupTotal: true,
                                ),
                              ),
                              _sectionTile(
                                title: "Shooting",
                                child: _emptyBudgetTable(viewModel),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _grandTotalRow(),
                    ],
                  ),
          );
        },
      ),
    );
  }

  // 🔹 SECTION TILE
  Widget _sectionTile({required String title, required Widget child}) {
    return ExpansionTile(
      initiallyExpanded: true,
      backgroundColor: const Color(0XFF9D306A),
      collapsedBackgroundColor: const Color(0XFF9D306A),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      children: [child],
    );
  }

  // 🔹 BUDGET TABLE
  Widget _budgetTable(
    BudgetVersionViewmodel viewModel, {
    required bool editable,
    bool showGroupTotal = false,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: Colors.grey.shade400),
        defaultColumnWidth: const FixedColumnWidth(150),
        children: [
          _headerRow(viewModel),

          ...List.generate(viewModel.callSheetData.length, (rowIndex) {
            final row = viewModel.callSheetData[rowIndex];

            return TableRow(
              decoration: const BoxDecoration(color: Colors.white),
              children: List.generate(viewModel.headers.length, (colIndex) {
                final header = viewModel.headers[colIndex];
                final value = row[colIndex];

                /// 🔹 Department Column
                if (colIndex == 0 && editable) {
                  return _editableCell(
                    value,
                    showEdit: viewModel.rowHasData(rowIndex),
                  );
                }

                /// 🔹 Percentage Column
                if (header == "Percentage") {
                  return _percentageCell();
                }

                /// 🔹 Normal Cell
                return _dataCell(value);
              }),
            );
          }),

          if (showGroupTotal) _groupTotalRow(),
        ],
      ),
    );
  }

  // 🔹 EMPTY TABLE
  Widget _emptyBudgetTable(BudgetVersionViewmodel viewModel, {int rows = 10}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: Colors.grey.shade400),
        defaultColumnWidth: const FixedColumnWidth(150),
        children: [
          _headerRow(viewModel),
          ...List.generate(
            rows,
            (_) => TableRow(
              decoration: const BoxDecoration(color: Colors.white),
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

  // 🔹 HEADER ROW
  TableRow _headerRow(BudgetVersionViewmodel viewModel) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      children: viewModel.headers.map(_headerCell).toList(),
    );
  }

  Widget _headerCell(String text) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  // 🔹 DATA CELL
  Widget _dataCell(String value) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        value,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  // 🔹 EDITABLE CELL
  Widget _editableCell(String value, {required bool showEdit}) {
    return Container(
      height: 40,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
          ),
          if (showEdit) ...[
            const SizedBox(width: 6),
            IconButton(
              icon: Icon(Icons.edit, size: 16, color: Colors.grey.shade600),
              onPressed: () {
                AppRouter.instance.push(RoutePaths.editBudgetScreen);
              },
            ),
          ],
        ],
      ),
    );
  }

  // 🔹 PERCENTAGE CELL
  Widget _percentageCell() {
    return Container(
      height: 40,
      color: Colors.white,
      padding: const EdgeInsets.all(6),
      child: LinearProgressIndicator(
        value: 0.4,
        backgroundColor: Colors.grey.shade300,
        color: Colors.grey.shade600,
      ),
    );
  }

  // 🔹 GROUP TOTAL
  TableRow _groupTotalRow() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      children: List.generate(
        15,
        (i) => i == 0
            ? const Center(child: Text("Group Total"))
            : i == 6
            ? const Center(child: Text("30,000"))
            : const SizedBox.shrink(),
      ),
    );
  }

  // 🔹 GRAND TOTAL
  Widget _grandTotalRow() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade400)),
      ),
      child: Row(
        children: const [
          Text("Grand Total", style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          Text("₹ 30,000", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
