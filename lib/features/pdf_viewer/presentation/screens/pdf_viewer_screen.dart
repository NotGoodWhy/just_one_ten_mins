import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/pdf_view_container.dart';
import '../../domain/models/pdf_file_info.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PdfFileInfo? _pdfFileInfo;
  bool _isLoading = false;

  Future<void> _pickPdfFile() async {
    setState(() => _isLoading = true);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      
      if (result != null) {
        final file = result.files.single;
        setState(() {
          _pdfFileInfo = PdfFileInfo(
            path: file.path!,
            name: file.name,
          );
        });
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('파일 선택 중 오류가 발생했습니다: $err')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pdfFileInfo?.name ?? 'PDF 뷰어'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_upload),
            onPressed: _isLoading ? null : _pickPdfFile,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pdfFileInfo == null
              ? const Center(child: Text('PDF 파일을 선택해주세요'))
              : PdfViewContainer(filePath: _pdfFileInfo!.path),
    );
  }
} 