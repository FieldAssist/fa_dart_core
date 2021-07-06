bool checkIfNotEmpty(String? value) {
  return value != null && value.isNotEmpty && value != "null";
}

bool checkIfListIsNotEmpty(List? list) {
  return list != null && list.isNotEmpty;
}

bool ifContainsKeyAndNotEmpty<T>(Map<String, T> map, String key) {
  return map.containsKey(key) &&
      map[key] != null &&
      map[key].toString().isNotEmpty;
}
