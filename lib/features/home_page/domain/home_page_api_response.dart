// import 'dart:convert';

class HomePageApiResponse {
  final Links? links;
  final int? total;
  final int? page;
  final int? pageSize;
  final List<Result>? results;

  HomePageApiResponse({
    this.links,
    this.total,
    this.page,
    this.pageSize,
    this.results,
  });

  HomePageApiResponse copyWith({
    Links? links,
    int? total,
    int? page,
    int? pageSize,
    List<Result>? results,
  }) =>
      HomePageApiResponse(
        links: links ?? this.links,
        total: total ?? this.total,
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        results: results ?? this.results,
      );

  factory HomePageApiResponse.fromJson(Map<String, dynamic> json) =>
      HomePageApiResponse(
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        total: json["total"],
        page: json["page"],
        pageSize: json["page_size"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );
}

class Links {
  final int? next;
  final dynamic previous;

  Links({
    this.next,
    this.previous,
  });

  Links copyWith({
    int? next,
    dynamic previous,
  }) =>
      Links(
        next: next ?? this.next,
        previous: previous ?? this.previous,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json["next"],
        previous: json["previous"],
      );
}

class Result {
  final String? thumbnail;
  final int? id;
  final String? title;
  final DateTime? dateAndTime;
  final String? slug;
  final DateTime? createdAt;
  final String? manifest;
  final int? liveStatus;
  final String? liveManifest;
  final bool? isLive;
  final String? channelImage;
  final String? channelName;
  final String? channelUsername;
  final bool? isVerified;
  final String? channelSlug;
  final String? channelSubscriber;
  final int? channelId;
  final String? type;
  final String? viewers;
  final String? duration;

  Result({
    this.thumbnail,
    this.id,
    this.title,
    this.dateAndTime,
    this.slug,
    this.createdAt,
    this.manifest,
    this.liveStatus,
    this.liveManifest,
    this.isLive,
    this.channelImage,
    this.channelName,
    this.channelUsername,
    this.isVerified,
    this.channelSlug,
    this.channelSubscriber,
    this.channelId,
    this.type,
    this.viewers,
    this.duration,
  });

  Result copyWith({
    String? thumbnail,
    int? id,
    String? title,
    DateTime? dateAndTime,
    String? slug,
    DateTime? createdAt,
    String? manifest,
    int? liveStatus,
    String? liveManifest,
    bool? isLive,
    String? channelImage,
    String? channelName,
    String? channelUsername,
    bool? isVerified,
    String? channelSlug,
    String? channelSubscriber,
    int? channelId,
    String? type,
    String? viewers,
    String? duration,
  }) =>
      Result(
        thumbnail: thumbnail ?? this.thumbnail,
        id: id ?? this.id,
        title: title ?? this.title,
        dateAndTime: dateAndTime ?? this.dateAndTime,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        manifest: manifest ?? this.manifest,
        liveStatus: liveStatus ?? this.liveStatus,
        liveManifest: liveManifest ?? this.liveManifest,
        isLive: isLive ?? this.isLive,
        channelImage: channelImage ?? this.channelImage,
        channelName: channelName ?? this.channelName,
        channelUsername: channelUsername ?? this.channelUsername,
        isVerified: isVerified ?? this.isVerified,
        channelSlug: channelSlug ?? this.channelSlug,
        channelSubscriber: channelSubscriber ?? this.channelSubscriber,
        channelId: channelId ?? this.channelId,
        type: type ?? this.type,
        viewers: viewers ?? this.viewers,
        duration: duration ?? this.duration,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        thumbnail: json["thumbnail"],
        id: json["id"],
        title: json["title"],
        dateAndTime: json["date_and_time"] == null
            ? null
            : DateTime.parse(json["date_and_time"]),
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        manifest: json["manifest"],
        liveStatus: json["live_status"],
        liveManifest: json["live_manifest"],
        isLive: json["is_live"],
        channelImage: json["channel_image"],
        channelName: json["channel_name"],
        channelUsername: json["channel_username"],
        isVerified: json["is_verified"],
        channelSlug: json["channel_slug"],
        channelSubscriber: json["channel_subscriber"],
        channelId: json["channel_id"],
        type: json["type"],
        viewers: json["viewers"],
        duration: json["duration"],
      );
}
