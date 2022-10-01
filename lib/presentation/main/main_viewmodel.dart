import 'package:template_mvvm_flutter/app/app_preferences.dart';
import 'package:template_mvvm_flutter/data/data_source/local_data_source.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/usecase/main_usecase.dart';
import 'package:template_mvvm_flutter/presentation/base/base_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render_impl.dart';
import 'package:template_mvvm_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

class MainViewModel extends BaseViewModel
    with MainViewModelInputs, MainViewModelOutputs {
  final MainUseCase _mainUseCase;
  final AppPreferences _appPreferences;
  final LocalDataSource _localDataSource;

  MainViewModel(this._mainUseCase, this._appPreferences, this._localDataSource);

  @override
  void start() {
    super.start();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  deleteSession(BuildContext context,VoidCallback goSplash) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
        message: AppStrings.empty));
    final sessionId = _appPreferences.getToken();
    (await _mainUseCase.execute(TestRequest(sessionId))).fold(
        (f) {
      inputState
          .add(ErrorState(StateRendererType.fullScreenErrorState, f.message));
    }, (r) async {
      inputState.add(ContentState());
      await _appPreferences.logout();
      _localDataSource.clearCache();
      goSplash.call();
    });
  }
}

abstract class MainViewModelInputs {
  deleteSession(BuildContext context,VoidCallback goSplash);
}

abstract class MainViewModelOutputs {}
