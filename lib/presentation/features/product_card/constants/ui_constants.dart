import 'package:flutter/material.dart';

class UiConstants {
  static const imagePadding = 52.0;
  // поскольку только после создания бэка я понял, что картинки изначально
  // должны были быть в вертикальном виде, то решил немного прийти к общему
  // значению обрезания
  static final padding =
      const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 10);
}
