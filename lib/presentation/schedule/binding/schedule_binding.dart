import 'package:get/get.dart';
import 'package:ipl/presentation/schedule/controller/schedule_controller.dart';

class ScheduleBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
  Get.put(ScheduleController());
  
  }

}