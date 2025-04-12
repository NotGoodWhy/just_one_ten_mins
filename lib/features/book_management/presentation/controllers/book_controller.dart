import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import 'package:just_one_ten_mins/features/book_management/domain/entities/book.dart';
import 'package:just_one_ten_mins/features/book_management/domain/usecases/get_all_books_usecase.dart';
import 'package:just_one_ten_mins/features/book_management/domain/usecases/get_book_by_id_usecase.dart';
import 'package:just_one_ten_mins/features/book_management/domain/usecases/save_book_usecase.dart';
import 'package:uuid/uuid.dart';

/// 도서 관리 상태
class BookState {
  final bool isLoading;
  final List<Book> books;
  final Book? selectedBook;
  final String? errorMessage;

  const BookState({
    this.isLoading = false,
    this.books = const [],
    this.selectedBook,
    this.errorMessage,
  });

  BookState copyWith({
    bool? isLoading,
    List<Book>? books,
    Book? selectedBook,
    String? errorMessage,
  }) {
    return BookState(
      isLoading: isLoading ?? this.isLoading,
      books: books ?? this.books,
      selectedBook: selectedBook ?? this.selectedBook,
      errorMessage: errorMessage,
    );
  }
}

/// 도서 관리 컨트롤러 (Riverpod)
class BookController extends StateNotifier<BookState> {
  final GetAllBooksUseCase getAllBooksUseCase;
  final GetBookByIdUseCase getBookByIdUseCase;
  final SaveBookUseCase saveBookUseCase;

  BookController({
    required this.getAllBooksUseCase,
    required this.getBookByIdUseCase,
    required this.saveBookUseCase,
  }) : super(const BookState());

  /// 모든 도서 로드
  Future<void> loadBooks() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final books = await getAllBooksUseCase(NoParams());
      state = state.copyWith(
        isLoading: false,
        books: books,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '도서 목록을 불러오는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// ID로 도서 로드
  Future<void> loadBookById(String id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final book = await getBookByIdUseCase(IdParams(id: id));
      state = state.copyWith(
        isLoading: false,
        selectedBook: book,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '도서를 불러오는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 새 도서 생성
  Future<void> createBook({
    required String title,
    required String author,
    required BookType type,
    String? thumbnailUrl,
    String? filePath,
    int? pageCount,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final newBook = Book(
        id: const Uuid().v4(),
        title: title,
        author: author,
        type: type,
        thumbnailUrl: thumbnailUrl,
        filePath: filePath,
        pageCount: pageCount,
        addedDate: DateTime.now(),
      );

      await saveBookUseCase(SaveBookParams(book: newBook));
      await loadBooks();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '도서를 생성하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 도서 업데이트
  Future<void> updateBook(Book book) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await saveBookUseCase(SaveBookParams(book: book));
      await loadBooks();
      if (state.selectedBook?.id == book.id) {
        state = state.copyWith(selectedBook: book);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '도서를 업데이트하는 중 오류가 발생했습니다: $e',
      );
    }
  }
}

/// 도서 컨트롤러 프로바이더
final bookControllerProvider =
    StateNotifierProvider<BookController, BookState>((ref) {
  final getAllBooksUseCase = ref.watch(getAllBooksUseCaseProvider);
  final getBookByIdUseCase = ref.watch(getBookByIdUseCaseProvider);
  final saveBookUseCase = ref.watch(saveBookUseCaseProvider);

  return BookController(
    getAllBooksUseCase: getAllBooksUseCase,
    getBookByIdUseCase: getBookByIdUseCase,
    saveBookUseCase: saveBookUseCase,
  );
});

/// GetAllBooksUseCase 프로바이더
final getAllBooksUseCaseProvider = Provider<GetAllBooksUseCase>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  return GetAllBooksUseCase(repository);
});

/// GetBookByIdUseCase 프로바이더
final getBookByIdUseCaseProvider = Provider<GetBookByIdUseCase>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  return GetBookByIdUseCase(repository);
});

/// SaveBookUseCase 프로바이더
final saveBookUseCaseProvider = Provider<SaveBookUseCase>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  return SaveBookUseCase(repository);
}); 