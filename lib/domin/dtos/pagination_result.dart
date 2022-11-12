
class PaginationResult{
  final int currentPage;
  final int itemsPerPage;
  final int totalItems;
  final int totalPages;

  PaginationResult(this.currentPage,this.itemsPerPage,this.totalItems,this.totalPages);

  factory PaginationResult.fromJson(Map<String,dynamic> json ){
    return PaginationResult(json['currentPage'], json['itemsPerPage'], json['totalItems'], json['totalPages']);
  }
}