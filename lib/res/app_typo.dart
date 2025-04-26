part of 'app_res.dart';

class AppTypo {
  AppTypo._();

  static final TextStyle _coreStyleComfortaa = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
  );

  static final headerXL = _coreStyleComfortaa.copyWith(
    fontSize: 32,
  );

  static final headerL = _coreStyleComfortaa.copyWith(
    fontSize: 28,
  );

  static final headerM = _coreStyleComfortaa.copyWith(
    fontSize: 24,
  );

  static final headerS = _coreStyleComfortaa.copyWith(
    fontSize: 20,
  );

  static final body1 = _coreStyleComfortaa.copyWith(
    fontSize: 18,
  );

  static final body2 = _coreStyleComfortaa.copyWith(
    fontSize: 16,
  );
}
