import 'package:get/get.dart';
import 'package:ipl/presentation/teammember/controller/teammember_controller.dart';

class TeamMemberBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TeamMemberController());
  }

}