import 'package:fallora/backend/model/horoscope/horoscope.dart';

abstract class HoroscopeUtil {
  static Horoscope horoscopeFromTimeMillis(int timeMillis) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeMillis);
    var month = date.month;
    var day = date.day;
    if ((month == 1 && day > 19) || (month == 2 && day < 19)) {
      return Horoscope.Aquarius;
    } else if ((month == 2 && day > 18) || (month == 3 && day < 21)) {
      return Horoscope.Pisces;
    } else if ((month == 3 && day > 20) || (month == 4 && day < 20)) {
       return Horoscope.Aries;
    } else if ((month == 4 && day > 19) || (month == 5 && day < 21)) {
       return Horoscope.Taurus;
    } else if ((month == 5 && day > 20) || (month == 6 && day < 21)) {
       return Horoscope.Gemini;
    } else if ((month == 6 && day > 20) || (month == 7 && day < 23)) {
       return Horoscope.Cancer;
    } else if ((month == 7 && day > 22) || (month == 8 && day < 23)) {
       return Horoscope.Leo;
    } else if ((month == 8 && day > 22) || (month == 9 && day < 23)) {
       return Horoscope.Virgo;
    } else if ((month == 9 && day > 22) || (month == 10 && day < 23)) {
       return Horoscope.Libra;
    } else if ((month == 10 && day > 22) || (month == 11 && day < 22)) {
       return Horoscope.Scorpio;
    } else if ((month == 11 && day > 21) || (month == 12 && day < 22)) {
       return Horoscope.Sagittarius;
    } else if ((month == 12 && day > 21) || (month == 1 && day < 20)) {
       return Horoscope.Capricorn;
    }
    return Horoscope.Gemini;
  }
}
