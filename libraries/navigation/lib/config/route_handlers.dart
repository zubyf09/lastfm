import 'package:core/model/responseModel/searches_response.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:search/ui/search_screen.dart';
import 'package:search/ui/search_detail_screen.dart';


final searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return SearchPage();
    });


final searchDetailHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchDetailPage(
    album: ModalRoute.of(context).settings.arguments as Album,
  );
});


