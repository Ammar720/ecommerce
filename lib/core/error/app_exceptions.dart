abstract class AppExceptions implements Exception {
  final String message;

  const AppExceptions(this.message);
}

class RemoteException extends AppExceptions {
  const RemoteException(super.message);
}

class LocalExceptions extends AppExceptions {
  const LocalExceptions(super.message);
}
