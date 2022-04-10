import 'package:get/get.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';

class HomeSCreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    // TODO: implement dependencies
  }

}