import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/my_properties_model.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  static FilterCubit get(context) => BlocProvider.of(context);
  int propertyForId = 0;
  List<PropertyTypeList> propertyList = [
    PropertyTypeList(0.toInt(), "Sell", true),
    PropertyTypeList(1.toInt(), "Rent", false)
  ];
void selectProperty(index){
    for (int i = 0; i < propertyList.length; i++) {
      propertyList[i].select = i == index;
      propertyForId = propertyList[index].id!;
    }
    print(propertyForId);
    emit(SelectPropertyState());
}
}
