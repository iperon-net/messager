import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'common_cubit.freezed.dart';
part 'common_state.dart';

@injectable
class CommonCubit extends Cubit<CommonState> {
  CommonCubit() : super(const CommonState.initial(connectivity: false));

  void connectivityListen() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        emit(const CommonState.initial(connectivity: true));
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        emit(const CommonState.initial(connectivity: true));
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        emit(const CommonState.initial(connectivity: true));
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        emit(const CommonState.initial(connectivity: true));
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        emit(const CommonState.initial(connectivity: true));
      } else {
        emit(const CommonState.initial(connectivity: false));
      }
    });
  }

}
