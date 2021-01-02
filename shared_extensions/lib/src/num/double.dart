extension SharedExtensionsDouble on double {
  /// Maps a number from a range to its value in another:\
  /// If value falls between baseLow and baseHigh
  /// will return the same value relocated between targetLow and targetHigh.
  double mapToRange(
    /// The lowest value in the source range.
    double baseLow,

    /// The highest value in the source range.
    double baseHigh,

    /// The lowest value in the target range.
    double targetLow,

    /// The highest value in the target range.
    double targetHigh,
  ) =>
      baseLow == null ||
              baseHigh == null ||
              targetLow == null ||
              targetHigh == null
          ? 0.0
          : (toDouble() - baseLow) /
                  (baseHigh - baseLow) *
                  (targetHigh - targetLow) +
              targetLow;
}
