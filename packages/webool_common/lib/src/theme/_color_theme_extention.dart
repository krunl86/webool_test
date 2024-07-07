part of 'theme.dart';

@immutable
class WeboolColors extends ThemeExtension<WeboolColors> {
  const WeboolColors({
    this.primaryRed,
    this.fontBlack,
    this.fontGrey,
    this.fontWhite,
    this.fontBlue,
    this.fontHintLightGrey,
    this.stateDisabled,
    this.stateEnabled,
    this.stateError,
    this.stateFocused,
  });
  final Color? primaryRed;
  final Color? fontBlack;
  final Color? fontGrey;
  final Color? fontWhite;
  final Color? fontBlue; 
  final Color? fontHintLightGrey;

  final Color? stateEnabled;
  final Color? stateFocused;
  final Color? stateError;
  final Color? stateDisabled;

  @override
  WeboolColors copyWith({
    Color? primaryRed,
    Color? fontBlack,
    Color? fontGrey,
  }) {
    return WeboolColors(
      primaryRed: primaryRed ?? this.primaryRed,
      fontBlack: fontBlack ?? this.fontBlack,
      fontGrey: fontGrey ?? this.fontGrey,
    );
  }

  @override
  ThemeExtension<WeboolColors> lerp(
      ThemeExtension<WeboolColors>? other, double t) {
    if (other is! WeboolColors) {
      return this;
    }
    return WeboolColors(
      primaryRed: Color.lerp(primaryRed, other.primaryRed, t)!,
      fontBlack: Color.lerp(fontBlack, other.fontBlack, t)!,
      fontGrey: Color.lerp(fontGrey, other.fontGrey, t)!,
    );
  }

  @override
  String toString() => 'MyUnboxColors(primary: $primaryRed,),';
}

WeboolColors weboolColorsColorsExtension(bool islight) => const WeboolColors(
      primaryRed: _WeboolColors.red,
      fontBlack: _WeboolColors.black,
      fontGrey: _WeboolColors.grey,
      fontWhite: _WeboolColors.white,
      fontBlue: _WeboolColors.blue,
      fontHintLightGrey: _WeboolColors.lightGrey,
      stateDisabled: _WeboolColors.grey,
      stateEnabled: _WeboolColors.grey,
      stateFocused: _WeboolColors.darkGrey,
      stateError: _WeboolColors.red,
    );

extension HomeListerColorsExtensions on ThemeData {
  WeboolColors get weboolColors => extension<WeboolColors>()!;
}
