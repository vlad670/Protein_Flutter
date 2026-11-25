// Исключение: Белок реально не найден в базе
class ProteinNotFoundException implements Exception {
  final String accessionId;
  ProteinNotFoundException(this.accessionId);
}
