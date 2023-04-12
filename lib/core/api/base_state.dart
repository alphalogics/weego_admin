import 'package:get/get.dart';

class BaseState<T> {
  var isInitial = false.obs;
  var isLoading = false.obs;
  var isCompleted = false.obs;
  var isError = false.obs;
  var isProcessing = false.obs;
  Rx<DateTime?> lastSuccessAt = Rx<DateTime?>(null);

  Rx<T?> response = Rx<T?>(null);
  var message = Rx<String?>('');
  var state = Rx<Status>(Status.INITIAL);

  BaseState() {
    isInitial.value = true;
    isLoading.value = false;
    isCompleted.value = false;
    isError.value = false;
    isProcessing.value = false;

    state.value = Status.INITIAL;
  }

  void notifyInitial() {
    response.value = null;

    isInitial.value = true;
    isLoading.value = false;
    isCompleted.value = false;
    isError.value = false;
    isProcessing.value = false;

    state.value = Status.INITIAL;
  }

  notifyLoading() {
    response.value = null;

    isInitial.value = false;
    isLoading.value = true;
    isCompleted.value = false;
    isError.value = false;
    isProcessing.value = true;

    state.value = Status.LOADING;
  }

  notifyCompleted(T data) {
    lastSuccessAt.value = DateTime.now();
    response.value = data;
    message.value = null;

    isInitial.value = false;
    isLoading.value = false;
    isCompleted.value = true;
    isError.value = false;
    isProcessing.value = false;

    state.value = Status.COMPLETED;
  }

  notifyError(String message) {
    response.value = null;
    this.message.value = message;

    isInitial.value = false;
    isLoading.value = false;
    isCompleted.value = false;
    isError.value = true;
    isProcessing.value = false;

    state.value = Status.ERROR;
  }

  notifyReload() {
    response.refresh();
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }
