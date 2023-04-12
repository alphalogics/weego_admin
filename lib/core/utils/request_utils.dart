import 'dart:async';
import 'package:flutter/material.dart';
import '../api/base_state.dart';
import '../exceptions/network_exception.dart';
import '../widgets/dialog/circular_progress_loader_dialog.dart';
import 'message_dialog.dart';

Future<BaseState<Res>> executeRequestWithState<Res>(
    {required BaseState<Res> state,
      String? loaderMessage,
      handleErrorMessage = false,
      handleSuccessMessage = false,
      required Future<Res> future,
      Function(Res response)? onSuccess,
      Function(String errorMessage)? onFailed,
      bool keepCurrentState = false}) async {
  var shouldEnableLoader = loaderMessage != null;

  var dialogContextCompleter = Completer<BuildContext>();

  try {
    if (keepCurrentState) {
      if (state.state.value == Status.INITIAL) {
        state.notifyLoading();
      }
    } else {
      state.notifyLoading();
    }

    if (shouldEnableLoader) {
      dialogContextCompleter =
          CircularProgressLoaderDialog.showLoader(loaderMessage);
    }

    var response = await future;

    if (shouldEnableLoader) {
      await closeDialog(dialogContextCompleter);
    }

    var dynamicRes = response as dynamic;

    if (handleSuccessMessage) {
      var message = '';
      try {
        message = dynamicRes.message != null
            ? dynamicRes.message.toString()
            : 'Success!';
        await showMessageDialog(
            mainMessage: message, type: MessageDialogType.success);
      } on NoSuchMethodError catch (_) {
        await showMessageDialog(
            mainMessage: 'Success!', type: MessageDialogType.success);
      }
    }

    state.notifyCompleted(response);
    if (onSuccess != null) {
      onSuccess(response!);
    }

    return state;
  } on NetworkException catch (e) {
    if (shouldEnableLoader) {
      await closeDialog(dialogContextCompleter);
    }

    if (handleErrorMessage) {
      showMessageDialog(
          mainMessage: e.getErrorMessage(), type: MessageDialogType.error);
    }

    state.notifyError(e.getErrorMessage());
    if (onFailed != null) {
      onFailed(e.getErrorMessage());
    }
  } on Exception catch  (e) {
    print(e.toString());
    var errorMessage = 'Unknown error, please contact administrator';
    if (shouldEnableLoader) {
      await closeDialog(dialogContextCompleter);
    }

    if (handleErrorMessage) {
      showMessageDialog(
          mainMessage: errorMessage, type: MessageDialogType.error);
    }

    if (onFailed != null) {
      onFailed(errorMessage);
    }
    state.notifyError(errorMessage);
  }

  return state;
}

closeDialog(Completer<BuildContext> dialogContextCompleter) async {
  try {
    final dialogContext = await dialogContextCompleter.future;
    Navigator.pop(dialogContext);
  } catch (e) {}
}
