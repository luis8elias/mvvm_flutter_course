abstract class Resource<T>{
  Resource();
}

class Init extends Resource{
  Init();
}

class Loading extends Resource{
  Loading();
}

class Success<T> extends Resource{
  final T data;
  Success(this.data);
}

class Error<T> extends Resource{
  final String message;
  Error(this.message);
}