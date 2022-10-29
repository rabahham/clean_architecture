abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and function that will be used through any view model.

}

abstract class BaseViewModelInputs {
  void start();

  void dispose(); // end or dies   // well be called when view model dies
}

abstract class BaseViewModelOutputs {
// well be implemanted later

}
