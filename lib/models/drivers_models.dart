class DriversModels {
  String rideDetails;
  String rideStatus;
  DriversModels({
    required this.rideDetails,
    this.rideStatus = "false",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rideDetails': rideDetails,
      'status': rideStatus,
    };
  }
}
