import 'package:flutter/material.dart';

extension HandleScrollNotification on ScrollNotification {
  bool handleScroll({Function? loadData}) {
    if (depth == 0) {
      if (this is ScrollEndNotification && loadData != null) {
        if (metrics.atEdge) {
          if (metrics.pixels != 0) {
            loadData();
          }
        }
      }
    }
    return false;
  }
}
