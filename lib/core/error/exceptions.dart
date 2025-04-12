/// 기본 예외 클래스
class AppException implements Exception {
  final String message;
  
  AppException(this.message);
  
  @override
  String toString() => message;
}

/// 네트워크 관련 예외
class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

/// 서버 관련 예외
class ServerException extends AppException {
  ServerException(String message) : super(message);
}

/// 캐시 관련 예외
class CacheException extends AppException {
  CacheException(String message) : super(message);
}

/// 로컬 데이터베이스 관련 예외
class LocalDatabaseException extends AppException {
  LocalDatabaseException(String message) : super(message);
}

/// 권한 관련 예외
class PermissionException extends AppException {
  PermissionException(String message) : super(message);
}

/// 파일 관련 예외
class FileException extends AppException {
  FileException(String message) : super(message);
}

/// 인증 관련 예외
class AuthException extends AppException {
  AuthException(String message) : super(message);
}

/// 입력 유효성 검사 관련 예외
class ValidationException extends AppException {
  ValidationException(String message) : super(message);
} 