class ApiRefrences {
  static const String apiKey = '407ed8bb79964707a1464358202609';
  // static const String locationKey =
  //     'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apiKey&q=islamabad';
  static const String locationString = 'Islamabad';
  static const String currentConditionApi =
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$locationString';
}
