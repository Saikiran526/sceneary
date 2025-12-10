import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../viewmodel/budget_version_viewmodel.dart';

class BudgetVersionScreen extends StatelessWidget {
  const BudgetVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BudgetVersionViewmodel(context: context),
      child: Consumer<BudgetVersionViewmodel>(
        builder: (context, vm, _) {
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
                      value: vm.selectedValue,
                      hint: const Text('Select version'),
                      items: vm.items
                          .map(
                            (i) => DropdownMenuItem(value: i, child: Text(i)),
                          )
                          .toList(),
                      onChanged: vm.changeValue,
                    ),
                  ),
                ],
              ),
              actions: [
                PopupMenuButton<String>(
                  itemBuilder: (ctx) => vm.menuOptions
                      .map((e) => PopupMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onSelected: vm.onMenuSelected,
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: vm.budgetFiles.isEmpty
                ? const Center(child: Text("Upload Excel files to view budget"))
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: vm.budgetFiles.length,
                    itemBuilder: (context, fileIdx) {
                      final file = vm.budgetFiles[fileIdx];

                      return AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.hardEdge,
                          child: ExpansionTile(
                            key: PageStorageKey(
                              'file_${fileIdx}_${file.fileName}',
                            ),
                            initiallyExpanded: file.expanded,
                            onExpansionChanged: (v) {
                              file.expanded = v;
                              vm.notifyListeners();
                            },
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            backgroundColor: const Color(0xFF8E2A57),
                            collapsedBackgroundColor: const Color(0xFF8E2A57),
                            title: Text(
                              file.fileName,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            children: file.sections.isEmpty
                                ? [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'No sheets found in this file',
                                      ),
                                    ),
                                  ]
                                : file.sections.map((section) {
                                    final sectionIdx = file.sections.indexOf(
                                      section,
                                    );
                                    return AnimatedSize(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.easeInOut,
                                      child: Container(
                                        color: Colors.white,
                                        child: ExpansionTile(
                                          key: PageStorageKey(
                                            'section_${fileIdx}_$sectionIdx',
                                          ),
                                          initiallyExpanded: section.expanded,
                                          onExpansionChanged: (v) {
                                            section.expanded = v;
                                            vm.notifyListeners();
                                          },
                                          title: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                            ),
                                            child: Text(
                                              section.title,
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                          children: [
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                color: const Color(0xFFF7F6F9),
                                                padding: const EdgeInsets.all(
                                                  8,
                                                ),
                                                child: SizedBox(
                                                  width: _calculateGridWidth(
                                                    section,
                                                  ),
                                                  height: 320.0,
                                                  child: SfDataGrid(
                                                    source: _BudgetDataSource(
                                                      section,
                                                      vm,
                                                    ),
                                                    allowEditing: !vm.isFrozen,
                                                    columnWidthMode:
                                                        ColumnWidthMode.auto,
                                                    columns: section.headers
                                                        .map(
                                                          (h) => GridColumn(
                                                            columnName: h,
                                                            label: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                    8,
                                                                  ),
                                                              child: Text(
                                                                h,
                                                                style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              color: const Color(0xFFEDD0E0),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 16,
                                                  ),
                                              child: Text(
                                                'Group Total',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }

  double _calculateGridWidth(BudgetSection section) {
    final basePerColumn = 140.0;
    final minWidth = 600.0;
    final calc = section.headers.length * basePerColumn;
    return (calc < minWidth ? minWidth : calc).toDouble();
  }
}

/// Safe DataGridSource
class _BudgetDataSource extends DataGridSource {
  final BudgetSection section;
  final BudgetVersionViewmodel viewmodel;
  List<DataGridRow> _dataGridRows = [];

  _BudgetDataSource(this.section, this.viewmodel) {
    _buildRows();
  }

  void _buildRows() {
    _dataGridRows = section.rows
        .map(
          (row) => DataGridRow(
            cells: List.generate(
              row.cells.length,
              (i) => DataGridCell(
                columnName: (i < section.headers.length)
                    ? section.headers[i]
                    : 'col_$i',
                value: _safeCellValue(row.cells[i]),
              ),
            ),
          ),
        )
        .toList();
  }

  dynamic _safeCellValue(dynamic val) {
    if (val is bool) return val ? 'TRUE' : 'FALSE';
    if (val == null) return '';
    return val.toString();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row
          .getCells()
          .map(
            (cell) => Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(cell.value?.toString() ?? ''),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget? buildEditWidget(
    DataGridRow row,
    RowColumnIndex rowColIndex,
    GridColumn column,
    CellSubmit submitCell,
  ) {
    final rowIndex = rowColIndex.rowIndex;
    final colIndex = rowColIndex.columnIndex;

    if (rowIndex < 0 || rowIndex >= section.rows.length) return null;
    if (colIndex < 0) return null;

    final initialValue = section.rows[rowIndex].cells.length > colIndex
        ? section.rows[rowIndex].cells[colIndex]?.toString() ?? ''
        : '';

    final controller = TextEditingController(text: initialValue);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          border: OutlineInputBorder(),
        ),
        onSubmitted: (newValue) {
          while (section.rows[rowIndex].cells.length <= colIndex) {
            section.rows[rowIndex].cells.add('');
          }
          section.rows[rowIndex].cells[colIndex] = newValue;
          _buildRows();
          notifyListeners();
          submitCell();
        },
      ),
    );
  }

  void notifyListeners() => notifyDataSourceListeners();
}
