import 'package:bloc/bloc.dart';
import 'package:oyo_ui/Cubit/hotel_repository.dart';
import 'package:oyo_ui/Cubit/hotel_state.dart';

class HotelCubit extends Cubit<HotelState>{
  final HotelRepository _repository;
  HotelCubit(this._repository): super(InitHotelState());

  Future<void> fetchHotel() async{
    emit(LoadingHotelState());
    final response = await _repository.getAll();
    emit(ResponseHotelState(response));
  }

}