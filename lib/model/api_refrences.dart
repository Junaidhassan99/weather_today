class ApiRefrences {
  static const String apiKey = '407ed8bb79964707a1464358202609';
  // static const String locationKey =
  //     'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apiKey&q=islamabad';
  //static const String locationString = 'London';
  static const int numberOfDaysForcast = 3;
  static const String basicApi = 'http://api.weatherapi.com/v1';
  static const String currentConditionApi =
      '$basicApi/current.json?key=$apiKey&q=';
  static const String forcastApi = '$basicApi/forecast.json?key=$apiKey&q=';
  static const String forcastApiEnd = '&days=$numberOfDaysForcast';
  static const String autoCompleteLocationApi =
      '$basicApi/search.json?key=$apiKey';
}
