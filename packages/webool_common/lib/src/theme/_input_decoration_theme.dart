part of 'theme.dart';

const _cornerRadius = 5.0;
final _inputDecorationLight = InputDecorationTheme(
  fillColor: _WeboolColors.background,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
  isDense: true,
  hintStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _WeboolColors.lightGrey,
    letterSpacing: 0.25,
  ),
  prefixIconColor: MaterialStateColor.resolveWith(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return _WeboolColors.grey;
      } else if (states.contains(MaterialState.error)) {
        return Colors.red;
      } else if (states.contains(MaterialState.focused)) {
        return _WeboolColors.darkGrey;
      } else if (states.contains(MaterialState.selected)) {
        return _WeboolColors.grey;
      }

      return _WeboolColors.red;
    },
  ),
  suffixIconColor: MaterialStateColor.resolveWith(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return _WeboolColors.grey;
      } else if (states.contains(MaterialState.error)) {
        return const Color.fromARGB(255, 226, 128, 121);
      } else if (states.contains(MaterialState.focused)) {
        return _WeboolColors.darkGrey;
      } else if (states.contains(MaterialState.selected)) {
        return _WeboolColors.grey;
      }

      return _WeboolColors.red;
    },
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: const BorderSide(
      width: 1,
      color: _WeboolColors.grey,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: const BorderSide(
      width: 1,
      color: _WeboolColors.grey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: const BorderSide(
      width: 1,
      color: _WeboolColors.darkGrey,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: const BorderSide(
      color: _WeboolColors.red,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: const BorderSide(
      width: 1,
      color: _WeboolColors.red,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: const BorderSide(
      width: 1,
      color: _WeboolColors.grey,
    ),
  ),
);
