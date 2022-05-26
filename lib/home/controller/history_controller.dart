import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController{
  DatePickerController controller = DatePickerController();

  final selectedValue = DateTime.now().obs;
}