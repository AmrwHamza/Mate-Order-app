import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String? firstName;
	final String? lastName;
	final String? phone;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;

	const User({
		this.firstName, 
		this.lastName, 
		this.phone, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				firstName: json['firstName'] as String?,
				lastName: json['lastName'] as String?,
				phone: json['phone'] as String?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'firstName': firstName,
				'lastName': lastName,
				'phone': phone,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				firstName,
				lastName,
				phone,
				updatedAt,
				createdAt,
				id,
		];
	}
}
