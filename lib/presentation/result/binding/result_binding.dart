import 'package:get/get.dart';
import 'package:ipl/presentation/result/controller/result_controller.dart';

class ResultBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResultController());
  }

}