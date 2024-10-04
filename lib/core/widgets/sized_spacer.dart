import 'package:flutter/material.dart';

final class SizedSpacer extends SizedBox {
  final double size;
  const SizedSpacer(this.size, {super.key});

  const SizedSpacer.horizontal(this.size, {super.key}) : super(width: size);
  const SizedSpacer.vertical(this.size, {super.key}) : super(height: size);
}
