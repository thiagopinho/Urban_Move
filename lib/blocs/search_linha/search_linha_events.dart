abstract class BuscaEvent {}

class LoadBusca extends BuscaEvent {
  final String query;

  LoadBusca({required this.query});
}

class AddBuscaEvent extends BuscaEvent {
  final String query;

  AddBuscaEvent({required this.query});
}

class RemoveBuscaEvent extends BuscaEvent {
  final String query;

  RemoveBuscaEvent({required this.query});
}
