// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_viewer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskViewerModel {

 String get id;@JsonKey(defaultValue: "user_id") String get userId; String get task; String get status;@JsonKey(defaultValue: "due_date") String get dueDate;
/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskViewerModelCopyWith<TaskViewerModel> get copyWith => _$TaskViewerModelCopyWithImpl<TaskViewerModel>(this as TaskViewerModel, _$identity);

  /// Serializes this TaskViewerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskViewerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.task, task) || other.task == task)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,task,status,dueDate);

@override
String toString() {
  return 'TaskViewerModel(id: $id, userId: $userId, task: $task, status: $status, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $TaskViewerModelCopyWith<$Res>  {
  factory $TaskViewerModelCopyWith(TaskViewerModel value, $Res Function(TaskViewerModel) _then) = _$TaskViewerModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(defaultValue: "user_id") String userId, String task, String status,@JsonKey(defaultValue: "due_date") String dueDate
});




}
/// @nodoc
class _$TaskViewerModelCopyWithImpl<$Res>
    implements $TaskViewerModelCopyWith<$Res> {
  _$TaskViewerModelCopyWithImpl(this._self, this._then);

  final TaskViewerModel _self;
  final $Res Function(TaskViewerModel) _then;

/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? task = null,Object? status = null,Object? dueDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskViewerModel].
extension TaskViewerModelPatterns on TaskViewerModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskViewerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskViewerModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskViewerModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskViewerModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(defaultValue: "user_id")  String userId,  String task,  String status, @JsonKey(defaultValue: "due_date")  String dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
return $default(_that.id,_that.userId,_that.task,_that.status,_that.dueDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(defaultValue: "user_id")  String userId,  String task,  String status, @JsonKey(defaultValue: "due_date")  String dueDate)  $default,) {final _that = this;
switch (_that) {
case _TaskViewerModel():
return $default(_that.id,_that.userId,_that.task,_that.status,_that.dueDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(defaultValue: "user_id")  String userId,  String task,  String status, @JsonKey(defaultValue: "due_date")  String dueDate)?  $default,) {final _that = this;
switch (_that) {
case _TaskViewerModel() when $default != null:
return $default(_that.id,_that.userId,_that.task,_that.status,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskViewerModel implements TaskViewerModel {
  const _TaskViewerModel({required this.id, @JsonKey(defaultValue: "user_id") required this.userId, required this.task, required this.status, @JsonKey(defaultValue: "due_date") required this.dueDate});
  factory _TaskViewerModel.fromJson(Map<String, dynamic> json) => _$TaskViewerModelFromJson(json);

@override final  String id;
@override@JsonKey(defaultValue: "user_id") final  String userId;
@override final  String task;
@override final  String status;
@override@JsonKey(defaultValue: "due_date") final  String dueDate;

/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskViewerModelCopyWith<_TaskViewerModel> get copyWith => __$TaskViewerModelCopyWithImpl<_TaskViewerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskViewerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskViewerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.task, task) || other.task == task)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,task,status,dueDate);

@override
String toString() {
  return 'TaskViewerModel(id: $id, userId: $userId, task: $task, status: $status, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$TaskViewerModelCopyWith<$Res> implements $TaskViewerModelCopyWith<$Res> {
  factory _$TaskViewerModelCopyWith(_TaskViewerModel value, $Res Function(_TaskViewerModel) _then) = __$TaskViewerModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(defaultValue: "user_id") String userId, String task, String status,@JsonKey(defaultValue: "due_date") String dueDate
});




}
/// @nodoc
class __$TaskViewerModelCopyWithImpl<$Res>
    implements _$TaskViewerModelCopyWith<$Res> {
  __$TaskViewerModelCopyWithImpl(this._self, this._then);

  final _TaskViewerModel _self;
  final $Res Function(_TaskViewerModel) _then;

/// Create a copy of TaskViewerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? task = null,Object? status = null,Object? dueDate = null,}) {
  return _then(_TaskViewerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
