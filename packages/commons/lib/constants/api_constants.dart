class AppUrl {
  static const String localBaseURL = "http://192.168.2.37:9000";
  static const String ngrokBaseURL =
      "https://5736-2003-ed-715-6bd5-1c96-b938-102-ab12.eu.ngrok.io";
  static const String baseURL = ngrokBaseURL;
  static const String dishesEndpoint = "$baseURL/dishes";
  static const String categoriesEndpoint = "$baseURL/dishes/categories";
}
