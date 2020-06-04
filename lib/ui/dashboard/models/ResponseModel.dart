

class ResponseModel {

  int requestStatusCode;
  String requestError;

  String displayError() {

    if (requestError.isNotEmpty) return requestError;

    if (requestStatusCode >= 400 && requestStatusCode < 500) {
      requestError = "There wan an issue with the network call. Page not found";
    }
    else if (requestStatusCode >= 500) {

    } else {
      requestError = "An unknow error has occured please";
    }

    return requestError;
  }

}