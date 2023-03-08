String? stripHtmlIfneede(String? text) {
  return text?.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
}
