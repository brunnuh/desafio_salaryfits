const token = '77aecac6a7fed4b08aec405228835ffd';

String makeApiUrl(String path) =>
    'https://api.openweathermap.org/data/$path?lang=pt_br&appid=$token';
