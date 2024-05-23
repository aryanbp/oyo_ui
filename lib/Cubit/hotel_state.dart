import 'hotel.dart';

abstract class HotelState{}

class InitHotelState extends HotelState{}

class LoadingHotelState extends HotelState{}

class ErrorHotelState extends HotelState{
  final String message;
  ErrorHotelState(this.message);
}

class ResponseHotelState extends HotelState{
  final List<Hotel> hotels ;
  ResponseHotelState(this.hotels);
}