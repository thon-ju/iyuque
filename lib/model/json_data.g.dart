// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPage<T> _$MyPageFromJson<T>(Map<String, dynamic> json) {
  return MyPage<T>(
    params: json['params'] as Map<String, dynamic>,
    rows: (json['rows'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  )
    ..pageNo = json['pageNo'] as int
    ..pageSize = json['pageSize'] as int
    ..totalCount = json['totalCount'] as int
    ..totalPages = json['totalPages'] as int;
}

Map<String, dynamic> _$MyPageToJson<T>(MyPage<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('params', instance.params);
  writeNotNull('pageNo', instance.pageNo);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('totalPages', instance.totalPages);
  writeNotNull('rows', instance.rows?.map(_Converter<T>().toJson)?.toList());
  return val;
}

IdEntity _$IdEntityFromJson(Map<String, dynamic> json) {
  return IdEntity()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String;
}

Map<String, dynamic> _$IdEntityToJson(IdEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..loginName = json['loginName'] as String
    ..name = json['name'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..phone = json['phone'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..post = json['post'] as String
    ..status = json['status'] as String
    ..roleName = json['roleName'] as String
    ..isManager = json['isManager'] as bool;
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('loginName', instance.loginName);
  writeNotNull('name', instance.name);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('post', instance.post);
  writeNotNull('status', instance.status);
  writeNotNull('roleName', instance.roleName);
  writeNotNull('isManager', instance.isManager);
  return val;
}

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..parentId = json['parentId'] as int
    ..parentIds = json['parentIds'] as String
    ..name = json['name'] as String
    ..ename = json['ename'] as String
    ..code = json['code'] as String
    ..type = json['type'] as String
    ..url = json['url'] as String
    ..icon = json['icon'] as String
    ..officeId = json['officeId'] as int;
}

Map<String, dynamic> _$MenuToJson(Menu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('parentId', instance.parentId);
  writeNotNull('parentIds', instance.parentIds);
  writeNotNull('name', instance.name);
  writeNotNull('ename', instance.ename);
  writeNotNull('code', instance.code);
  writeNotNull('type', instance.type);
  writeNotNull('url', instance.url);
  writeNotNull('icon', instance.icon);
  writeNotNull('officeId', instance.officeId);
  return val;
}

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version()
    ..code = json['code'] as String
    ..remark = json['remark'] as String
    ..url = json['url'] as String
    ..ver = json['ver'] as String
    ..platform = json['platform'] as String;
}

Map<String, dynamic> _$VersionToJson(Version instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('remark', instance.remark);
  writeNotNull('url', instance.url);
  writeNotNull('ver', instance.ver);
  writeNotNull('platform', instance.platform);
  return val;
}

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    name: json['name'] as String,
  )
    ..custom_id = json['custom_id'] as int
    ..id = json['id'] as int
    ..type = json['type'] as String
    ..slug = json['slug'] as String
    ..namespace = json['namespace'] as String
    ..user_id = json['user_id'] as int
    ..description = json['description'] as String
    ..creator_id = json['creator_id'] as int
    ..public = json['public'] as int
    ..likes_count = json['likes_count'] as int
    ..watches_count = json['watches_count'] as int
    ..doc_count = json['doc_count'] as int
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String;
}

Map<String, dynamic> _$BookToJson(Book instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custom_id', instance.custom_id);
  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('slug', instance.slug);
  writeNotNull('name', instance.name);
  writeNotNull('namespace', instance.namespace);
  writeNotNull('user_id', instance.user_id);
  writeNotNull('description', instance.description);
  writeNotNull('creator_id', instance.creator_id);
  writeNotNull('public', instance.public);
  writeNotNull('likes_count', instance.likes_count);
  writeNotNull('watches_count', instance.watches_count);
  writeNotNull('doc_count', instance.doc_count);
  writeNotNull('created_at', instance.created_at);
  writeNotNull('updated_at', instance.updated_at);
  return val;
}

Doc _$DocFromJson(Map<String, dynamic> json) {
  return Doc(
    title: json['title'] as String,
  )
    ..custom_id = json['custom_id'] as int
    ..id = json['id'] as int
    ..book_id = json['book_id'] as int
    ..slug = json['slug'] as String
    ..user_id = json['user_id'] as int
    ..format = json['format'] as String
    ..public = json['public'] as int
    ..status = json['status'] as int
    ..likes_count = json['likes_count'] as int
    ..comments_count = json['comments_count'] as int
    ..watches_count = json['watches_count'] as int
    ..content_updated_at = json['content_updated_at'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..book = json['book'] == null
        ? null
        : Book.fromJson(json['book'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DocToJson(Doc instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custom_id', instance.custom_id);
  writeNotNull('id', instance.id);
  writeNotNull('book_id', instance.book_id);
  writeNotNull('slug', instance.slug);
  writeNotNull('title', instance.title);
  writeNotNull('user_id', instance.user_id);
  writeNotNull('format', instance.format);
  writeNotNull('public', instance.public);
  writeNotNull('status', instance.status);
  writeNotNull('likes_count', instance.likes_count);
  writeNotNull('comments_count', instance.comments_count);
  writeNotNull('watches_count', instance.watches_count);
  writeNotNull('content_updated_at', instance.content_updated_at);
  writeNotNull('created_at', instance.created_at);
  writeNotNull('updated_at', instance.updated_at);
  writeNotNull('book', instance.book);
  return val;
}

DocDetail _$DocDetailFromJson(Map<String, dynamic> json) {
  return DocDetail(
    title: json['title'] as String,
  )
    ..custom_id = json['custom_id'] as int
    ..id = json['id'] as int
    ..book_id = json['book_id'] as int
    ..slug = json['slug'] as String
    ..user_id = json['user_id'] as int
    ..format = json['format'] as String
    ..body = json['body'] as String
    ..body_draft = json['body_draft'] as String
    ..body_html = json['body_html'] as String
    ..body_lake = json['body_lake'] as String
    ..public = json['public'] as int
    ..status = json['status'] as int
    ..likes_count = json['likes_count'] as int
    ..comments_count = json['comments_count'] as int
    ..watches_count = json['watches_count'] as int
    ..content_updated_at = json['content_updated_at'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..book = json['book'] == null
        ? null
        : Book.fromJson(json['book'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DocDetailToJson(DocDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custom_id', instance.custom_id);
  writeNotNull('id', instance.id);
  writeNotNull('book_id', instance.book_id);
  writeNotNull('slug', instance.slug);
  writeNotNull('title', instance.title);
  writeNotNull('user_id', instance.user_id);
  writeNotNull('format', instance.format);
  writeNotNull('body', instance.body);
  writeNotNull('body_draft', instance.body_draft);
  writeNotNull('body_html', instance.body_html);
  writeNotNull('body_lake', instance.body_lake);
  writeNotNull('public', instance.public);
  writeNotNull('status', instance.status);
  writeNotNull('likes_count', instance.likes_count);
  writeNotNull('comments_count', instance.comments_count);
  writeNotNull('watches_count', instance.watches_count);
  writeNotNull('content_updated_at', instance.content_updated_at);
  writeNotNull('created_at', instance.created_at);
  writeNotNull('updated_at', instance.updated_at);
  writeNotNull('book', instance.book);
  return val;
}
