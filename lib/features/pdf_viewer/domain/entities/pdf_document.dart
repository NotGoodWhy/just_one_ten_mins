/// PDF 문서 개체
class PdfDocument {
  final String id;
  final String path;
  final String? name;
  final int pageCount;
  final List<String>? extractedText;
  final DateTime? lastOpenedAt;
  
  const PdfDocument({
    required this.id,
    required this.path,
    this.name,
    required this.pageCount,
    this.extractedText,
    this.lastOpenedAt,
  });
  
  PdfDocument copyWith({
    String? id,
    String? path,
    String? name,
    int? pageCount,
    List<String>? extractedText,
    DateTime? lastOpenedAt,
  }) {
    return PdfDocument(
      id: id ?? this.id,
      path: path ?? this.path,
      name: name ?? this.name,
      pageCount: pageCount ?? this.pageCount,
      extractedText: extractedText ?? this.extractedText,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
    );
  }
} 