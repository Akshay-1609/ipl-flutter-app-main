import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ipl/presentation/adminpanel/adminpanel_screen.dart';
import 'package:ipl/presentation/adminpanel/binding/adminpanel_binding.dart';
import 'package:ipl/presentation/homescreen/binding/home_binding.dart';
import 'package:ipl/presentation/homescreen/home_screen.dart';
import 'package:ipl/presentation/livescore/binding/livescore_binding.dart';
import 'package:ipl/presentation/livescore/live_score.dart';
import 'package:ipl/presentation/livescore/widget/no_internet.dart';
import 'package:ipl/presentation/result/binding/result_binding.dart';
import 'package:ipl/presentation/result/result_screen.dart';
import 'package:ipl/presentation/schedule/binding/schedule_binding.dart';
import 'package:ipl/presentation/schedule/schedule_screen.dart';
import 'package:ipl/presentation/splashscreen/splash_screen.dart';
import 'package:ipl/presentation/teammember/binding/teammember_binding.dart';
import 'package:ipl/presentation/teammember/teammember_screen.dart';
import 'package:ipl/presentation/teams/binding/team_binding.dart';
import 'package:ipl/presentation/teams/teams_screen.dart';


class AppRoutes {
  static String splashscreen = "/splashscreen";
  static String homescreen = "/homescreen";
  static String schedulescreen = "/schedulescreen";
  static String resultscreen = "/resultscreen";
  static String teamscreen = "/teamscreen";
  static String teammemberscreen = "/teammemberscreen";
  static String livescorescreen = "/livescorescreen";
  static String adminpanelscreen = "/adminpanelscreen";
 static String nointernetscreen = "/nointernetscreen";

  static List<GetPage> pages = [
     GetPage(
      name: splashscreen,
      page: () => const SplashScreen(),
     
    ),
    GetPage(
      name: homescreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeSCreenBinding(),
      ],
    ),
    GetPage(
      name: schedulescreen,
      page: () => const ScheduleScreen(),
      bindings: [
        ScheduleBinding(),
      ],
    ),
    GetPage(
      name: resultscreen,
      page: () => const ResultScreen(),
      bindings: [
        ResultBinding(),
      ],
    ),
     GetPage(
      name: nointernetscreen,
      page: () => const NoInternetPage(),
    ),
    GetPage(
      name: teamscreen,
      page: () => const TeamsScreen(),
      bindings: [
        TeamBinding(),
      ],
    ),
    GetPage(
      name: teammemberscreen,
      page: () => const TeamMemberScreen(),
      bindings: [
        TeamMemberBinding(),
      ],
    ),

    GetPage(
      name: livescorescreen,
      page: () => const LiveScroe(),
      bindings: [
        LiveScoreBinding(),
      ],
    ),
      GetPage(
      name: adminpanelscreen,
      page: () => const AdminPanel(),
      bindings: [
        AdminPanelBinding(),
      ],
    ),
  ];
}
