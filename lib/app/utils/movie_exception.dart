import 'package:dio/dio.dart';

class MoviesException implements Exception {
  MoviesException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        message = "A solicitação para o servidor API foi cancelada 😰";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        message = "Tempo limite de conexão com servidor API 😰";
        break;
      case DioErrorType.DEFAULT:
        message =
            "A conexão com o servidor API falhou devido à conexão com a Internet 😰";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = "Tempo limite de espera em conexão com o servidor API 😰";
        break;
      case DioErrorType.RESPONSE:
        message = _handleError(dioError.response.statusCode);
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = "Tempo limite de envio em conexão com o servidor API 😰";
        break;
      default:
        message = "Algo deu errado 😰";
        break;
    }
  }

  String message;

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Requisição mal formada 😰';
      case 404:
        return 'O recurso solicitado não foi encontrado 😰';
      case 500:
        return 'Erro interno no servidor 😰';
      default:
        return 'Ops, algo deu errado 😰';
    }
  }

  @override
  String toString() => message;
}
