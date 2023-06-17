const token = '77aecac6a7fed4b08aec405228835ffd';

String makeApiUrl(String path) =>
    'https://api.openweathermap.org/data/2.5/$path?appid=$token';
