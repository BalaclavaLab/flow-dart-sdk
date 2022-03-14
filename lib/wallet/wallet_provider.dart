import 'package:equatable/equatable.dart';

class WalletProvider extends Equatable {
  final String endpoint;
  final String name;

  WalletProvider(this.endpoint, this.name);

  @override
  List<Object?> get props => [endpoint, name];
}
