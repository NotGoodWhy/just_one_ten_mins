import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewContainer extends StatelessWidget {
  final String filePath;

  const PdfViewContainer({
    super.key,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: filePath,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF 로드 중 오류: $error')),
        );
      },
      onPageError: (page, error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('페이지 $page 로드 중 오류: $error')),
        );
      },
    );
  }
} 