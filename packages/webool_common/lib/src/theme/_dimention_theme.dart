part of 'theme.dart';

/// Design size is bigger than most mobiles screens
/// To keep dimensions coherent with the mockups we are using
/// .h to scale the dimensions based on current screen size.
/// Screen utils should inly be used here and for that purpose
/// Eventually we gonna use the same concept to scale fonts and radii if
/// it's relevant

final _spaceDimensions = SpaceDimensions(
  largest: 55,
  larger: 40,
  large: 30,
  medium: 20,
  small: 15,
  smaller: 10,
  smallest: 5,
);

final _insetsDimensions = InsetDimensions(
  largest: 50,
  larger: 40,
  large: 30,
  medium: 20,
  small: 15,
  smaller: 10,
  smallest: 5,
);

const double kRoundRadius = 100000;

final _radiiDimensions = RadiusDimensions(
    largest: 24,
    larger: 20,
    large: 16,
    medium: 12,
    small: 8,
    smaller: 5,
    smallest: 3);

final _borderWidthDimensions = BorderWidthDimensions(
    largest: 24,
    larger: 20,
    large: 16,
    medium: 12,
    small: 8,
    smaller: 5,
    smallest: 3);
