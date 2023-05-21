import 'package:flutter/cupertino.dart';import 'package:get/get_navigation/src/nav2/get_nav_config.dart';import 'package:get/get_navigation/src/nav2/get_router_delegate.dart';import 'package:get/get_navigation/src/routes/get_route.dart';import '../View/pages/FirstPage/first_main_page.dart';import '../View/pages/Post_Page/Post_Page_main_page.dart';import '../View/pages/Send_Schedules/Send_Schedules_main_page.dart';import '../View/pages/Send_news/Send_news_main_page.dart';import '../View/pages/Signin_page/Signin_main_page.dart';import '../View/pages/addUser/AddUser_main_page.dart';import '../View/pages/student/Add_student/Add_student_main_page.dart';import '../View/pages/student/Student_main_page.dart';import '../View/pages/student/add_stages/Add_stages.dart';abstract class Routes {  static const Student = '/student';  static const Add_User = '/Add_User';  static const Sign_IN_Page = '/Sign_IN_Page';  static const Post_Page = '/Post_Page';  static const User = '/User';  static const Home_Page = '/Home_Page';  static const Send_News_Page = '/Send_News_Page';  static const Send_Schedules_Page = '/Send_Schedules_Page';}abstract class AppPages {  static final pages = [    GetPage(      name: Routes.Sign_IN_Page,      page: () => Signin_main_page(),    ),    // GetPage(    //   name: Routes.User,    //   page: () => splash_main_page(),    // ),    GetPage(      name: Routes.Send_News_Page,      page: () => const Send_news_main_page(),    ),    ////////////////////////////////////////    GetPage(      name: Routes.Home_Page,      page: () => First_main_page(),    ),    GetPage(      name: Routes.Student,      page: () => Student_main_page(),    ),    GetPage(      name: Routes.Post_Page,      page: () => Post_main_page(),    ),    GetPage(      name: Routes.Send_Schedules_Page,      page: () => Schedules_main_page(),    ),    GetPage(      name: Routes.Add_User,      page: () => AddUser_main_page(),    ),  ];}class AppRouterDelegate extends GetDelegate {  @override  Widget build(BuildContext context) {    return Navigator(      onPopPage: (route, result) => route.didPop(result),      pages: currentConfiguration != null          ? [currentConfiguration!.currentPage!]          : [GetNavConfig.fromRoute(Routes.Sign_IN_Page)!.currentPage!],    );  }}