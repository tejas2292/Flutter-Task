// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

AllUserModel allUserModelFromJson(String str) =>
    AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
  AllUserModel({
    this.status,
    this.payload,
    this.meta,
  });

  Status status = Status();
  List<Payload> payload;
  Meta meta = Meta();

  factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
        status: Status.fromJson(json["status"]),
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    this.pageNumber,
    this.start,
    this.total,
  });

  int pageNumber;
  dynamic start;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pageNumber: json["page_number"],
        start: json["start"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page_number": pageNumber,
        "start": start,
        "total": total,
      };
}

class Payload {
  Payload({
    this.isCurrentCompany,
    this.active,
    this.isPro,
    this.meetingCharges,
    this.callDuration,
    this.isOnline,
    this.isVerified,
    this.role,
    this.points,
    this.postCount,
    this.messageCount,
    this.contactCount,
    this.replyCount,
    this.replyCounts,
    this.likeCount,
    this.forwardCount,
    this.shareCount,
    this.inviteCount,
    this.callCount,
    this.profileViewCount,
    this.skills,
    this.isPublic,
    this.isFollowing,
    this.meetingCount,
    this.attendedMeetingCount,
    this.invitationCount,
    this.bookingCount,
    this.attendedBookingCount,
    this.serviceCharges,
    this.totalCharges,
    this.id,
    this.lastLogin,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.availabilityDays,
    this.availabilityEnd,
    this.availabilityStart,
    this.bio,
    this.bod,
    this.callTimeZone,
    this.callTitle,
    this.city,
    this.companyName,
    this.companyThumb,
    this.country,
    this.education,
    this.fcmToken,
    this.firstName,
    this.iban,
    this.lastName,
    this.link,
    this.occupation,
    this.thumb,
    this.timezone,
    this.timezoneName,
    this.videoIntro,
    this.videoIntroThumb,
    this.workEnd,
    this.workStart,
    this.proValidity,
    this.location,
    this.email,
  });

  bool isCurrentCompany;
  bool active;
  bool isPro;
  int meetingCharges;
  int callDuration;
  bool isOnline;
  bool isVerified;
  Role role;
  int points;
  int postCount;
  int messageCount;
  int contactCount;
  int replyCount;
  int replyCounts;
  int likeCount;
  int forwardCount;
  int shareCount;
  int inviteCount;
  int callCount;
  int profileViewCount;
  List<String> skills;
  bool isPublic;
  bool isFollowing;
  int meetingCount;
  int attendedMeetingCount;
  int invitationCount;
  int bookingCount;
  int attendedBookingCount;
  int serviceCharges;
  int totalCharges;
  String id;
  DateTime lastLogin;
  String phoneNumber;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AvailabilityDays availabilityDays;
  int availabilityEnd;
  int availabilityStart;
  String bio;
  DateTime bod;
  dynamic callTimeZone;
  String callTitle;
  String city;
  String companyName;
  dynamic companyThumb;
  Country country;
  dynamic education;
  String fcmToken;
  String firstName;
  String iban;
  String lastName;
  String link;
  String occupation;
  String thumb;
  String timezone;
  String timezoneName;
  dynamic videoIntro;
  dynamic videoIntroThumb;
  DateTime workEnd;
  DateTime workStart;
  DateTime proValidity;
  Location location;
  String email;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        isCurrentCompany: json["is_current_company"],
        active: json["active"],
        isPro: json["is_pro"],
        meetingCharges: json["meeting_charges"],
        callDuration: json["call_duration"],
        isOnline: json["is_online"],
        isVerified: json["is_verified"],
        role: roleValues.map[json["role"]],
        points: json["points"],
        postCount: json["post_count"],
        messageCount: json["message_count"],
        contactCount: json["contact_count"],
        replyCount: json["reply_count"],
        replyCounts: json["reply_counts"],
        likeCount: json["like_count"],
        forwardCount: json["forward_count"],
        shareCount: json["share_count"],
        inviteCount: json["invite_count"],
        callCount: json["call_count"],
        profileViewCount: json["profile_view_count"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        isPublic: json["is_public"],
        isFollowing: json["is_following"],
        meetingCount: json["meeting_count"],
        attendedMeetingCount: json["attended_meeting_count"],
        invitationCount: json["invitation_count"],
        bookingCount: json["booking_count"],
        attendedBookingCount: json["attended_booking_count"],
        serviceCharges: json["service_charges"],
        totalCharges: json["total_charges"],
        id: json["_id"],
        lastLogin: DateTime.parse(json["last_login"]),
        phoneNumber: json["phone_number"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        availabilityDays: json["availability_days"] == null
            ? null
            : AvailabilityDays.fromJson(json["availability_days"]),
        availabilityEnd:
            json["availability_end"] == null ? null : json["availability_end"],
        availabilityStart: json["availability_start"] == null
            ? null
            : json["availability_start"],
        bio: json["bio"] == null ? null : json["bio"],
        bod: json["bod"] == null ? null : DateTime.parse(json["bod"]),
        callTimeZone: json["call_time_zone"],
        callTitle: json["call_title"] == null ? null : json["call_title"],
        city: json["city"] == null ? null : json["city"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        companyThumb: json["company_thumb"],
        country: countryValues.map[json["country"]],
        education: json["education"],
        fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
        firstName: json["first_name"],
        iban: json["iban"] == null ? null : json["iban"],
        lastName: json["last_name"],
        link: json["link"] == null ? null : json["link"],
        occupation: json["occupation"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        timezoneName:
            json["timezone_name"] == null ? null : json["timezone_name"],
        videoIntro: json["video_intro"],
        videoIntroThumb: json["video_intro_thumb"],
        workEnd:
            json["work_end"] == null ? null : DateTime.parse(json["work_end"]),
        workStart: json["work_start"] == null
            ? null
            : DateTime.parse(json["work_start"]),
        proValidity: json["pro_validity"] == null
            ? null
            : DateTime.parse(json["pro_validity"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "is_current_company": isCurrentCompany,
        "active": active,
        "is_pro": isPro,
        "meeting_charges": meetingCharges,
        "call_duration": callDuration,
        "is_online": isOnline,
        "is_verified": isVerified,
        "role": roleValues.reverse[role],
        "points": points,
        "post_count": postCount,
        "message_count": messageCount,
        "contact_count": contactCount,
        "reply_count": replyCount,
        "reply_counts": replyCounts,
        "like_count": likeCount,
        "forward_count": forwardCount,
        "share_count": shareCount,
        "invite_count": inviteCount,
        "call_count": callCount,
        "profile_view_count": profileViewCount,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "is_public": isPublic,
        "is_following": isFollowing,
        "meeting_count": meetingCount,
        "attended_meeting_count": attendedMeetingCount,
        "invitation_count": invitationCount,
        "booking_count": bookingCount,
        "attended_booking_count": attendedBookingCount,
        "service_charges": serviceCharges,
        "total_charges": totalCharges,
        "_id": id,
        "last_login": lastLogin.toIso8601String(),
        "phone_number": phoneNumber,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "availability_days":
            availabilityDays == null ? null : availabilityDays.toJson(),
        "availability_end": availabilityEnd == null ? null : availabilityEnd,
        "availability_start":
            availabilityStart == null ? null : availabilityStart,
        "bio": bio == null ? null : bio,
        "bod": bod == null ? null : bod.toIso8601String(),
        "call_time_zone": callTimeZone,
        "call_title": callTitle == null ? null : callTitle,
        "city": city == null ? null : city,
        "company_name": companyName == null ? null : companyName,
        "company_thumb": companyThumb,
        "country": countryValues.reverse[country],
        "education": education,
        "fcm_token": fcmToken == null ? null : fcmToken,
        "first_name": firstName,
        "iban": iban == null ? null : iban,
        "last_name": lastName,
        "link": link == null ? null : link,
        "occupation": occupation,
        "thumb": thumb == null ? null : thumb,
        "timezone": timezone == null ? null : timezone,
        "timezone_name": timezoneName == null ? null : timezoneName,
        "video_intro": videoIntro,
        "video_intro_thumb": videoIntroThumb,
        "work_end": workEnd == null ? null : workEnd.toIso8601String(),
        "work_start": workStart == null ? null : workStart.toIso8601String(),
        "pro_validity":
            proValidity == null ? null : proValidity.toIso8601String(),
        "location": location == null ? null : location.toJson(),
        "email": email == null ? null : email,
      };
}

class AvailabilityDays {
  AvailabilityDays({
    this.sun,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
  });

  bool sun;
  bool mon;
  bool tue;
  bool wed;
  bool thu;
  bool fri;
  bool sat;

  factory AvailabilityDays.fromJson(Map<String, dynamic> json) =>
      AvailabilityDays(
        sun: json["sun"],
        mon: json["mon"],
        tue: json["tue"],
        wed: json["wed"],
        thu: json["thu"],
        fri: json["fri"],
        sat: json["sat"],
      );

  Map<String, dynamic> toJson() => {
        "sun": sun,
        "mon": mon,
        "tue": tue,
        "wed": wed,
        "thu": thu,
        "fri": fri,
        "sat": sat,
      };
}

enum Country { INDIA, EMPTY, BAHRAIN, COUNTRY_BAHRAIN }

final countryValues = EnumValues({
  "Bahrain ": Country.BAHRAIN,
  "Bahrain": Country.COUNTRY_BAHRAIN,
  "": Country.EMPTY,
  "India": Country.INDIA
});

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

enum Role { USER }

final roleValues = EnumValues({"user": Role.USER});

class Status {
  Status({
    this.statusCode,
    this.message,
  });

  int statusCode;
  String message;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
