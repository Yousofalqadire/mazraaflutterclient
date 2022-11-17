part of 'ad_details_bloc.dart';

abstract class AdDetailsEvent extends Equatable {
  const AdDetailsEvent();

  @override
  List<Object> get props => [];
}
class GetAdDetailsEvent extends AdDetailsEvent{
  final int adId;
  const GetAdDetailsEvent({required this.adId});
}
