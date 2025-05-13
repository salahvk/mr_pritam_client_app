

class MissionModel {
  final String id;
  final String user;
  final List<String> staff;
  final List<String> staffAccepted;
  final List<String> staffSeen;
  final List<Department> departments;
  final List<Role> roles;
  final String orderId;
  final String date;
  final String fromTime;
  final String toTime;
  final int price;
  final int subTotal;
  final int total;
  final int vat;
  final bool superMission;
  final String jobStatus;
  final String status;
  final String createdAt;
  final String updatedAt;
  final AllBookingId allBookingId;

  MissionModel({
    required this.id,
    required this.user,
    required this.staff,
    required this.staffAccepted,
    required this.staffSeen,
    required this.departments,
    required this.roles,
    required this.orderId,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.price,
    required this.subTotal,
    required this.total,
    required this.vat,
    required this.superMission,
    required this.jobStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.allBookingId,
  });

  factory MissionModel.fromJson(Map<String, dynamic> json) {
    return MissionModel(
      id: json['_id'],
      user: json['user'],
      staff: List<String>.from(json['staff']),
      staffAccepted: List<String>.from(json['staffAccepted']),
      staffSeen: List<String>.from(json['staffSeen']),
      departments: List<Department>.from(json['departments'].map((x) => Department.fromJson(x))),
      roles: List<Role>.from(json['roles'].map((x) => Role.fromJson(x))),
      orderId: json['orderId'],
      date: json['date'],
      fromTime: json['fromTime'],
      toTime: json['toTime'],
      price: json['price'],
      subTotal: json['subTotal'],
      total: json['total'],
      vat: json['vat'],
      superMission: json['superMission'],
      jobStatus: json['jobStatus'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      allBookingId: AllBookingId.fromJson(json['allBookingId']),
    );
  }
}

class Department {
  final String departmentId;
  final int quantity;

  Department({
    required this.departmentId,
    required this.quantity,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentId: json['departmentId'],
      quantity: json['quantity'],
    );
  }
}

class Role {
  final String roleId;
  final int quantity;

  Role({
    required this.roleId,
    required this.quantity,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json['roleId'],
      quantity: json['quantity'],
    );
  }
}

class AllBookingId {
  final Location location;
  final String id;
  final String user;
  final dynamic coupon;
  final bool couponUsed;
  final List<String> bookingIds;
  final String orderId;
  final int vat;
  final int couponDiscount;
  final int subTotal;
  final int total;
  final List<String> outfits;
  final List<String> equipment;
  final bool staffMealProvided;
  final bool bringYourId;
  final List<String> mobility;
  final int pinCode;
  final String name;
  final String address;
  final String country;
  final String state;
  final String city;
  final String invoiceName;
  final String invoiceAddress;
  final String invoiceCity;
  final String invoiceCountry;
  final String companyRegistrationNumber;
  final String invoiceDetails;
  final String status;
  final List<dynamic> taskList;
  final String createdAt;
  final String updatedAt;

  AllBookingId({
    required this.location,
    required this.id,
    required this.user,
    required this.coupon,
    required this.couponUsed,
    required this.bookingIds,
    required this.orderId,
    required this.vat,
    required this.couponDiscount,
    required this.subTotal,
    required this.total,
    required this.outfits,
    required this.equipment,
    required this.staffMealProvided,
    required this.bringYourId,
    required this.mobility,
    required this.pinCode,
    required this.name,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.invoiceName,
    required this.invoiceAddress,
    required this.invoiceCity,
    required this.invoiceCountry,
    required this.companyRegistrationNumber,
    required this.invoiceDetails,
    required this.status,
    required this.taskList,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AllBookingId.fromJson(Map<String, dynamic> json) {
    return AllBookingId(
      location: Location.fromJson(json['location']),
      id: json['_id'],
      user: json['user'],
      coupon: json['coupon'],
      couponUsed: json['couponUsed'],
      bookingIds: List<String>.from(json['bookingIds']),
      orderId: json['orderId'],
      vat: json['vat'],
      couponDiscount: json['couponDiscount'],
      subTotal: json['subTotal'],
      total: json['total'],
      outfits: List<String>.from(json['outfits']),
      equipment: List<String>.from(json['equipment']),
      staffMealProvided: json['staffMealProvided'],
      bringYourId: json['bringYourId'],
      mobility: List<String>.from(json['mobility']),
      pinCode: json['pinCode'],
      name: json['name'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      invoiceName: json['invoiceName'],
      invoiceAddress: json['invoiceAddress'],
      invoiceCity: json['invoiceCity'],
      invoiceCountry: json['invoiceCountry'],
      companyRegistrationNumber: json['companyRegistrationNumber'],
      invoiceDetails: json['invoiceDetails'],
      status: json['status'],
      taskList: json['taskList'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }
}
