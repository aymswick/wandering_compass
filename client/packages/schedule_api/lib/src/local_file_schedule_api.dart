import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:schedule_api/schedule_api.dart';

class LocalFileScheduleApi implements ScheduleApi {
  Future<String> get config async {
    try {
      final result = await FilePicker.platform.pickFiles();

      final file = File(result!.files.single.path!);
      final content = await file.readAsString();
      print(content);
      return content;
    } catch (e) {
      print('Error getting schedule config file');
      rethrow;
    }
  }

  @override
  Future<int> getWorkingHours() async {
    final hours = int.parse(await config);
    return hours;
  }
}
