import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as sync;

class BudgetRow {
  List<dynamic> cells;
  BudgetRow(this.cells);
}

class BudgetSection {
  String title;
  List<String> headers;
  List<BudgetRow> rows;
  bool expanded;

  BudgetSection({
    required this.title,
    required this.headers,
    required this.rows,
    this.expanded = true,
  });
}

class BudgetFile {
  String fileName;
  List<BudgetSection> sections;
  bool expanded;

  BudgetFile({
    required this.fileName,
    required this.sections,
    this.expanded = true,
  });
}

/// ViewModel

class BudgetVersionViewmodel extends ChangeNotifier {
  final BuildContext context;
  BudgetVersionViewmodel({required this.context});

  List<BudgetFile> budgetFiles = [];
  bool isFrozen = false;

  void toggleFreeze() {
    isFrozen = !isFrozen;
    notifyListeners();
  }

  String? selectedValue;
  List<String> items = ["Version 1", "Version 2", "Version 3"];

  void changeValue(String? value) {
    selectedValue = value;
    notifyListeners();
  }

  /// Upload Excel - Convert everything to string except numbers
  Future<void> uploadExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['xlsx'],
      type: FileType.custom,
    );

    if (result == null) return;

    for (var platformFile in result.files) {
      if (platformFile.path == null) continue;

      final bytes = File(platformFile.path!).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);

      List<BudgetSection> sections = [];

      for (final sheetName in excel.tables.keys) {
        final sheet = excel.tables[sheetName]!;
        if (sheet.rows.isEmpty) continue;

        /// Headers
        final headers = sheet.rows.first.map((cell) {
          return cell?.value?.toString() ?? '';
        }).toList();

        /// Remaining rows with safe conversion
        final rows = sheet.rows.skip(1).map((row) {
          final rowCells = row.map((c) {
            final val = c?.value;
            if (val is bool) return val != null ? 'TRUE' : 'FALSE';
            return val?.toString() ?? '';
          }).toList();

          return BudgetRow(rowCells);
        }).toList();

        sections.add(
          BudgetSection(title: sheetName, headers: headers, rows: rows),
        );
      }

      budgetFiles.add(
        BudgetFile(fileName: platformFile.name, sections: sections),
      );
    }

    notifyListeners();
  }

  /// Download Excel - Safe writing to workbook

  Future<void> downloadExcel() async {
    if (budgetFiles.isEmpty) return;

    final workbook = sync.Workbook();
    int sheetIndex = 0;

    for (var file in budgetFiles) {
      for (var section in file.sections) {
        sync.Worksheet sheet;

        /// Safely set sheet names (max 31 chars)
        var safeName = '${file.fileName}__${section.title}'.replaceAll(
          '.xlsx',
          '',
        );
        if (safeName.length > 31) safeName = safeName.substring(0, 31);

        if (sheetIndex == 0) {
          sheet = workbook.worksheets[0];
          sheet.name = safeName;
        } else {
          sheet = workbook.worksheets.addWithName(safeName);
        }

        /// Write headers
        for (int c = 0; c < section.headers.length; c++) {
          sheet.getRangeByIndex(1, c + 1).setText(section.headers[c]);
        }

        /// Write data rows
        for (int r = 0; r < section.rows.length; r++) {
          for (int c = 0; c < section.rows[r].cells.length; c++) {
            final value = section.rows[r].cells[c];

            if (value is num) {
              sheet.getRangeByIndex(r + 2, c + 1).setNumber(value.toDouble());
            } else {
              sheet
                  .getRangeByIndex(r + 2, c + 1)
                  .setText(value?.toString() ?? '');
            }
          }
        }

        sheetIndex++;
      }
    }

    final Directory dir = await getTemporaryDirectory();
    final String path = '${dir.path}/updated_budget.xlsx';

    final bytes = workbook.saveAsStream();
    workbook.dispose();

    final file = File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes);

    OpenFilex.open(path);
  }

  List<String> menuOptions = [
    'Add Budget',
    'Upload Sheets',
    'Edit Budget',
    'Download Sheet',
    'Freeze Budget',
  ];

  void onMenuSelected(String option) {
    switch (option) {
      case 'Upload Sheets':
        uploadExcel();
        break;
      case 'Download Sheet':
        downloadExcel();
        break;
      case 'Edit Budget':
        AppRouter.instance.push(RoutePaths.editBudgetScreen);
        isFrozen = false;
        notifyListeners();
        break;
      case 'Freeze Budget':
        toggleFreeze();
        break;
      case 'Add Budget':
        // future implementation
        AppRouter.instance.push(RoutePaths.actualsScreen);

        break;
    }
  }

  void clearAll() {
    budgetFiles.clear();
    notifyListeners();
  }
}
