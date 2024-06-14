import 'package:bloc/bloc.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

class IndexCustomerCubit extends Cubit<int> {
  IndexCustomerCubit() : super(0);

  changeCustomer(int index) async {
    await SharedPrefUtils().storedCurentCustomer(index);
    emit(index);
  }
}
