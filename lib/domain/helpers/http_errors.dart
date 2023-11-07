abstract class HttpError implements Exception {}

class UndefinedHttpError implements HttpError {}

class UnathenticatedHttpError implements HttpError {}

class ServerHttpError implements HttpError {}

class SocketHttpError implements HttpError {}
