import 'package:example/controller_state.dart';
import 'package:example/enum.dart';
import 'package:flutter/material.dart';

class HandleViewState extends StatelessWidget {
  final ControllerState state;
  final void Function()? onReload;
  final Widget? child;
  final Widget Function(BuildContext context, String message)? onError;
  final Widget Function(BuildContext context, String message)? onLoading;
  const HandleViewState({
    super.key,
    required this.state,
    this.onReload,
    this.child,
    this.onError,
    this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    switch (state.viewState) {
      case ViewState.loading:
        return onLoading != null
            ? onLoading!(context, state.message)
            : const Center(
                child: CircularProgressIndicator(),
              );
      case ViewState.error:
        {
          return onError != null
              ? onError!(context, state.message)
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.message),
                      const Padding(padding: EdgeInsets.all(4)),
                      ElevatedButton(
                        onPressed: onReload,
                        child: const Text(
                          'Coba lagi',
                        ),
                      ),
                    ],
                  ),
                );
        }
      case ViewState.sucsess:
        {
          return child ?? const SizedBox();
        }
      default:
        return const SizedBox();
    }
  }
}
