part of 'rent_bloc.dart';

abstract class RentEvent extends Equatable {
  const RentEvent();

  @override
  List<Object> get props => [];
}

class GetRentsEvent extends RentEvent{}
class GetRentsByAddress extends RentEvent{
  final List<AdEntity> rents;
  final String address;
 const GetRentsByAddress({required this.rents, required this.address});

}
class GetRentsByPrice extends RentEvent{
  final List<AdEntity> rents;
  final double start;
  final double end;
  const GetRentsByPrice({required this.rents,required this.start,required this.end});
}
