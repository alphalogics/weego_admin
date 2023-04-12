class URLs {

  static const baseUrl = 'http://ilaayn.com/api';

  static const login = '/user/sign-in';
  static const changePassword = '/user/change-password';

  static const getLinks = '/links/get';
  static const saveLinks = '/links/save';

  static const getNews = '/news/get';
  static const saveNews = '/news/create';
  static String getSingleNews(String? newsId) {
    return '/news/edit/$newsId';
  }
  static String updateNews(String? newsId) {
    return '/news/update/$newsId';
  }
  static String deleteNews(String? newsId) {
    return '/news/delete/$newsId';
  }

  static const getVideos = '/videos/get';
  static const saveVideos = '/videos/create';
  static String getSingleVideos(String? videoId) {
    return '/videos/edit/$videoId';
  }
  static String updateVideos(String? videoId) {
    return '/videos/update/$videoId';
  }
  static String deleteVideos(String? videoId) {
    return '/videos/delete/$videoId';
  }

  static const getHeader = '/header/get';
  static const updateHeader = '/header/update';

}