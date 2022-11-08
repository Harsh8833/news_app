class URLConstants {
  // static const baseUrl = "http://206.189.135.73:8001/api/";
  // static const basicBseUrl = "https://api.smeworld.asia/";
  static const basicBaseUrl = "https://api.smeworld.asia/";
  static const baseUrl = basicBaseUrl + "api/";
  static const imageUrl = basicBaseUrl;

  ///APIS **********************************************************************
  static const homeApiUrl = baseUrl + "home/content";
  static const videosApiUrl = baseUrl + "video/all";
  static const tealApiUrl = baseUrl + "teams/all";
  static const servicesApiUrl = baseUrl + "service/all";
  static const settingApiUrl = baseUrl + "cms/settings";
  static const reportBySlugApiUrl = baseUrl + "article/detail/";
  static const commentsByArticleIdApiUrl = baseUrl + "comments/";
  static const articlesByCategoryIdApiUrl = baseUrl + "article/by-category/";
  static const articlesByCategorySlugApiUrl =
      baseUrl + "article/by-category-slug/";
  static const articlesByKeyWordApiUrl =
      baseUrl + "article/by-keyword?keyword=";
  static const recentPostApiUrl = baseUrl + "article/recent";
  static const digitalMagazineApiUrl = baseUrl + "magazines/archive";
  static const authorDetailsByNameApiUrl = baseUrl + "authors/details?name=";
  static const commentsByArticleApiUrl = baseUrl + "comments/";
  static const createCommentApiUrl = baseUrl + "comments/create";
  static const createContactRequestApiUrl = baseUrl + "contact_request/create";
  static const visitorCountApiUrl = baseUrl + "article/visit-count/";
}

// http://206.189.135.73:8001/images/upload/teams/upload-1660826136268.jpeg

/// Articles
// {{url}}/api/article/by-category/5?limit=10&page=1

// sroll bar
