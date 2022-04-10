import 'package:get/get.dart';
import 'package:ipl/presentation/vanue/controller/vanue_controller.dart';

class VanueBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => VanueController());
  }

}