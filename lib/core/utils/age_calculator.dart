import '../constants/app/application_constants.dart';

class AgeCalculator {
  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static int calculateAgeFromYear(int year) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - year;
    return age;
  }

  static bool isAgeValid(DateTime birthDate, int minAge) {
    int age = calculateAge(birthDate);
    if (age >= minAge) {
      return true;
    } else {
      return false;
    }
  }

  static bool isAgeValidFromYear(int year, int minAge) {
    int age = calculateAgeFromYear(year);
    if (age >= minAge) {
      return true;
    } else {
      return false;
    }
  }

  static bool isAgeValidAppAge(DateTime birthDate) {
    return isAgeValid(birthDate, ApplicationConstants.appAge);
  }

  static bool isAgeValidAppAgeFromYear(int year) {
    return isAgeValidFromYear(year, ApplicationConstants.appAge);
  }

  static DateTime getBirthDateFromAge(int age) {
    DateTime currentDate = DateTime.now();
    int year = currentDate.year - age;
    DateTime birthDate = DateTime(year, currentDate.month, currentDate.day);
    return birthDate;
  }

  static int getYearFromAge(int age) {
    DateTime currentDate = DateTime.now();
    int year = currentDate.year - age;
    return year;
  }

  static DateTime get getBirthDateFromAppAge => getBirthDateFromAge(ApplicationConstants.appAge);

  static int get getYearFromAppAge => getYearFromAge(ApplicationConstants.appAge);
}
