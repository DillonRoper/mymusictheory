import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mymusictheory/providers/language_provider.dart';

/// This class creates a Text-like widget that automatically listens for updates
/// from the LanguageProvider such that it is always up to date.
class ConsumerText extends Consumer<LanguageProvider> {
  final String text;
  final TextStyle? style;
  final String? semanticsLabel;

  /// Creates a new instance of ConsumerText
  /// Parameters:
  /// - this.text - the name of the text key that corresponds to a String in models/text_for_language.dart
  /// - this.style - the desired TextStyle for the underlying Text widget
  /// - this.semanticsLabel - the desired SemanticsLabel for the underlying Text widget
  ConsumerText(this.text, {this.style, this.semanticsLabel, super.key}): super(builder: (context, provider, widget) {
    return Text(provider.get(text), style: style, semanticsLabel: semanticsLabel);
  });
}