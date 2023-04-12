import 'package:get/get.dart';
import '../../modules/auth/login/presentation/login_binding.dart';
import '../../modules/auth/login/presentation/login_page.dart';
import '../../modules/dashboard/home/presentaion/home_binding.dart';
import '../../modules/dashboard/home/presentaion/home_page.dart';
import '../../modules/dashboard/news_management/add_news/add_news_binding.dart';
import '../../modules/dashboard/news_management/add_news/add_news_page.dart';
import '../../modules/dashboard/news_management/edit_news/edit_news_binding.dart';
import '../../modules/dashboard/news_management/edit_news/edit_news_page.dart';
import '../../modules/dashboard/news_management/list_news/list_news_binding.dart';
import '../../modules/dashboard/news_management/list_news/list_news_page.dart';
import '../../modules/dashboard/news_management/view_news/view_news_binding.dart';
import '../../modules/dashboard/news_management/view_news/view_news_page.dart';
import '../../modules/dashboard/setting/presentation/setting_binding.dart';
import '../../modules/dashboard/setting/presentation/setting_page.dart';
import '../../modules/dashboard/videos_management/add_video/add_video_binding.dart';
import '../../modules/dashboard/videos_management/add_video/add_video_page.dart';
import '../../modules/dashboard/videos_management/edit_video/edit_video_binding.dart';
import '../../modules/dashboard/videos_management/edit_video/edit_video_page.dart';
import '../../modules/dashboard/videos_management/list_video/list_video_binding.dart';
import '../../modules/dashboard/videos_management/list_video/list_video_page.dart';
import '../../modules/dashboard/videos_management/view_video/view_video_binding.dart';
import '../../modules/dashboard/videos_management/view_video/view_video_page.dart';
import '../../modules/splash/presentation/splash_binding.dart';
import '../../modules/splash/presentation/splash_page.dart';

abstract class Routes {

  // Splash
  static const initial = '/splash';

  //admin
  static const login = '/login';
  static const adminHome = '/admin-home';

  //news
  static const addNews = '/add-news';
  static const editNews = '/edit-news';
  static const viewNews = '/view-news';
  static const listNews = '/list-news';

  //video
  static const addVideo = '/add-video';
  static const editVideo = '/edit-video';
  static const viewVideo = '/view-video';
  static const listVideo = '/list-video';

  //setting
  static const setting = '/setting';

}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.initial,
        page: () => SplashPage(),
        binding: SplashBinding(),
      transition: Transition.noTransition),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.adminHome,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.setting,
        page: () => SettingPage(),
        binding: SettingBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addNews,
        page: () => AddNewsPage(),
        binding: AddNewsBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.editNews,
        page: () => EditNewsPage(),
        binding: EditNewsBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.viewNews,
        page: () => ViewNewsPage(),
        binding: ViewNewsBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.listNews,
        page: () => ListNewsPage(),
        binding: ListNewsBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.addVideo,
        page: () => AddVideoPage(),
        binding: AddVideoBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.editVideo,
        page: () => EditVideoPage(),
        binding: EditVideoBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.listVideo,
        page: () => ListVideoPage(),
        binding: ListVideoBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.viewVideo,
        page: () => ViewVideoPage(),
        binding: ViewVideoBinding(),
        transition: Transition.noTransition),
  ];
}
