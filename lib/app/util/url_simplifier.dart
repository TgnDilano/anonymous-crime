class UriSimplifier {
  static Uri uri(String url, dynamic param) {
    final urlString = "$url${objectToQueryString(param)}";
    return Uri.parse(urlString);
  }

  static String objectToQueryString(dynamic json) {
    if (json == null) return "";
    List<String> queries = [];
    if (json is Map) {
      for (var key in json.keys) {
        if (json[key] is Map) {
          generateInnerMap(queries, "$key", json[key]);
        } else if (json[key] is List) {
          generateInnerList(queries, "$key", json[key]);
        } else {
          queries.add("$key=${json[key]}");
        }
      }
    } else if (json is List) {
      generateInnerList(queries, "", json);
    }
    return Uri.encodeFull("?${queries.join("&")}");
  }

  static generateInnerMap(
    List<String> queryList,
    String parentKey,
    Map<String, dynamic> innerJson,
  ) {
    for (var key in innerJson.keys) {
      if (innerJson[key] is Map) {
        generateInnerMap(queryList, "$parentKey[$key]", innerJson[key]);
      } else if (innerJson[key] is List) {
        generateInnerList(queryList, "$parentKey[$key]", innerJson[key]);
      } else {
        queryList.add("$parentKey[$key]=${innerJson[key]}");
      }
    }
  }

  static generateInnerList(
    List<String> queryList,
    String parentKey,
    List<dynamic> innerList,
  ) {
    for (var item in innerList) {
      if (item is Map) {
        generateInnerMap(
            queryList, "$parentKey[]", item as Map<String, dynamic>);
      } else {
        queryList.add("$parentKey[]=$item");
      }
    }
  }
}
