import 'package:get/get.dart';
import 'package:ipl/presentation/livescore/controller/livescore_controller.dart';

class  LiveScoreBinding  extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LiveScoreController());
  }

  
}