abstract class IAdService {
  static IAdService get instance => throw UnimplementedError();

  Future<void> init();

  Future<void> dispose();
}
