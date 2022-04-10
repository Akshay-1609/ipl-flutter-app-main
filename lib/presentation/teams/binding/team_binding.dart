import 'package:get/get.dart';
import 'package:ipl/presentation/teams/controller/team_controller.dart';

class TeamBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(TeamController());
  }

}