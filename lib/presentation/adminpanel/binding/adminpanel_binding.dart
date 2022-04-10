import 'package:get/get.dart';
import 'package:ipl/presentation/adminpanel/controller/adminpanel_controller.dart';

class AdminPanelBinding  extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(AdminPanelController());
  }
  
}