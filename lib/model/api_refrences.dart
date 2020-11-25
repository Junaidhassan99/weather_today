class ApiRefrences {
  static const String apiKey = 'cdde31ad80044a66b4352147202411';
  static const int numberOfDaysForcast = 3;
  static const String basicApi = 'http://api.weatherapi.com/v1';

  static String currentConditionApi(String name) {
    return '$basicApi/current.json?key=$apiKey&q=$name';
  }

  static String forcastApi(String name) {
    return '$basicApi/forecast.json?key=$apiKey&q=$name&days=$numberOfDaysForcast';
  }

  static String autoCompleteLocationApi(String name) {
    return '$basicApi/search.json?key=$apiKey&q=$name';
  }
}
