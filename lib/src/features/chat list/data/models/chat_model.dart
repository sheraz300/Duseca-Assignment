import 'package:flutter/material.dart';

class PinnedChat {
  final Widget avatar;
  final String title;
  final String subtitle;
  final int? badgeCount;

  PinnedChat({
    required this.avatar,
    required this.title,
    required this.subtitle,
    this.badgeCount,
  });
}

class AllChat {
  final Widget avatar;
  final String title;
  final String subtitle;

  AllChat({
    required this.avatar,
    required this.title,
    required this.subtitle,
  });
}
