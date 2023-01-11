Map<String, String?> getVariableByJavaScript(
    String script, List<String> variableName) {
  Map<String, String?> variableMap = {};
  variableName.forEach((name) {
    final regex = RegExp("(\\n|;).*?${name}.*?=(.*?)(\\n|;)");
    final variableMatch = regex.firstMatch(script);
    if (variableMatch != null && variableMatch.groupCount >= 3) {
      final value = variableMatch.group(2)?.trim();
      variableMap[name] = value;
    }
  });
  return variableMap;
}