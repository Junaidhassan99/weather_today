class ApiRefrences {
  // static const String locationKey =
  //     'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apiKey&q=islamabad';
  //static const String locationString = 'London';
  static const String apiKey = '407ed8bb79964707a1464358202609';
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
