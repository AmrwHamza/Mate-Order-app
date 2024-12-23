class Pagination {
	int? currentPage;
	int? lastPage;
	int? total;
	int? perPage;
	String? nextPageUrl;
	String? prevPageUrl;

	Pagination({
		this.currentPage, 
		this.lastPage, 
		this.total, 
		this.perPage, 
		this.nextPageUrl, 
		this.prevPageUrl, 
	});

	factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
				currentPage: json['current_page'] as int?,
				lastPage: json['last_page'] as int?,
				total: json['total'] as int?,
				perPage: json['per_page'] as int?,
				nextPageUrl: json['next_page_url'] as String?,
				prevPageUrl: json['prev_page_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'current_page': currentPage,
				'last_page': lastPage,
				'total': total,
				'per_page': perPage,
				'next_page_url': nextPageUrl,
				'prev_page_url': prevPageUrl,
			};
}
