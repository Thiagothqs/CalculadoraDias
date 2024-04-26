import 'package:bloc/bloc.dart';
import 'order_map_state.dart';

class OrderMapBloc extends Cubit<OrderMapState> {
  OrderMapBloc() : super(OrderMapState());

  void loadMap() async {
    emit(OrderMapState());
  }
}
