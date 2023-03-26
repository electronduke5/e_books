abstract class ApiStatus<T extends Object> {
  final T? item;
  final String? message;
  final Map<String, dynamic>? data;

  const ApiStatus({this.item, this.message, this.data});
}

class IdleStatus<T extends Object> extends ApiStatus<T> {
  const IdleStatus();
}

class LoadingStatus<T extends Object> extends ApiStatus<T> {
  LoadingStatus();
}

class LoadedStatus<T extends Object> extends ApiStatus<T> {
  LoadedStatus({T? item, Map<String, dynamic>? data}) : super(item: item, data: data);
}

class FailedStatus<T extends Object> extends ApiStatus<T> {
  FailedStatus(String? message) : super(message: message);
}
