part of 'theme.dart';

final _lightElevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: _WeboolColors.red,
    foregroundColor: _WeboolColors.white,
    disabledBackgroundColor: _WeboolColors.white,
    disabledForegroundColor: _WeboolColors.white,
    minimumSize: const Size(120, 35),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);
