import 'package:json_annotation/json_annotation.dart';

part 'json_data.g.dart';


class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    String _class = T.toString();

    if (json is Map<String, dynamic>) {
      if(_class == 'Repo'){
        return Repo.fromJson(json) as T;
      }
    }

    return json as T;
  }

  @override
  Object toJson(T object) {
    String _class = T.toString();

    if(_class == 'BoqPlanDetail'){


    }
    return object;
  }
}


@JsonSerializable(includeIfNull: false)
class MyPage<T>{
  MyPage({this.params, this.rows});
  Map<String, dynamic> params;

  int pageNo;
  int pageSize;
  int totalCount;
  int totalPages;

  @_Converter()
  List<T> rows;

  factory MyPage.fromJson(Map<String, dynamic> json) => _$MyPageFromJson<T>(json);
  Map<String, dynamic> toJson() => _$MyPageToJson(this);
}

@JsonSerializable(includeIfNull: false)
class IdEntity{

  IdEntity();

  int id;
  int delFlag; // 删除标记（0：正常；1：删除；2：审核）
  int createdBy;
  String createdByName;
  String createdDate;

  factory IdEntity.fromJson(Map<String, dynamic> json) => _$IdEntityFromJson(json);
  Map<String, dynamic> toJson() => _$IdEntityToJson(this);

  @override
  String noSuchMethod(Invocation invocation) {
    print('${invocation.memberName}属性不存在');
    return '';
  }
}

@JsonSerializable(includeIfNull: false)
class User extends IdEntity{
  User();

  String loginName = '';
  String name = '';
  String phoneNumber = '';
  String phone = '';
  String email = '';
  String password = '';
  String post = '';
  String status = '';
  String roleName = '';
  bool isManager;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Menu extends IdEntity{
  Menu();

  int parentId;
  String parentIds;
  String name;
  String ename;
  String code;
  String type;
  String url;
  String icon;
  int officeId;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}


@JsonSerializable(includeIfNull: false)
class Version {
  Version();

  String code;
  String remark;
  String url;
  String ver;
  String platform;

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}


@JsonSerializable(includeIfNull: false)
class Repo{

  Repo({this.name = ''});

  int id; // 仓库编号
  String type; 	// 类型
  String slug; 	// 仓库路径
  String name; 	// 名称
  String namespace; 	// 仓库完整路径
  int user_id; // 所属团队/用户编号
  String description; // 介绍
  int creator_id; 	// 创建人
  int public; 	// 公开状态 [1 - 公开, 0 - 私密]
  int likes_count; 	// 喜欢数量
  int watches_count; //  订阅数量
  String created_at ; // 创建时间
  String updated_at ;	// 更新时间

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Doc{

  Doc({this.title = ''});

  int id; // 文档编号
  String slug; 	// 文档路径
  String title; 	// 标题
  int user_id; // 创建人
  String format; // 描述了正文的格式 [asl, markdown]
  int public; 	// 公开状态 [1 - 公开, 0 - 私密]
  int status; 	// 状态 [1 - 正常, 0 - 草稿]
  int likes_count; 	// 喜欢数量
  int comments_count ; 	// 评论数量
  int watches_count; //  订阅数量
  String content_updated_at; //  文档内容更新时间
  String created_at ; // 创建时间
  String updated_at ;	// 更新时间

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
  Map<String, dynamic> toJson() => _$DocToJson(this);
}

@JsonSerializable(includeIfNull: false)
class DocDetail{

  DocDetail({this.title = ''});

  int id; // 文档编号
  String slug; 	// 文档路径
  String title; 	// 标题
  int user_id; // 创建人
  String format; // 描述了正文的格式 [asl, markdown]
  String body; // 正文 Markdown 源代码
  String body_draft; // 草稿 Markdown 源代码
  String body_html; // 转换过后的正文 HTML
  String body_lake; // 语雀 lake 格式的文档内容
  int public; 	// 公开状态 [1 - 公开, 0 - 私密]
  int status; 	// 状态 [1 - 正常, 0 - 草稿]
  int likes_count; 	// 喜欢数量
  int comments_count ; 	// 评论数量
  int watches_count; //  订阅数量
  String content_updated_at; //  文档内容更新时间
  String created_at ; // 创建时间
  String updated_at ;	// 更新时间

  factory DocDetail.fromJson(Map<String, dynamic> json) => _$DocDetailFromJson(json);
  Map<String, dynamic> toJson() => _$DocDetailToJson(this);
}
