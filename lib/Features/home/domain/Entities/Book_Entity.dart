import 'package:hive/hive.dart';
part 'Book_Entity.g.dart';

 @HiveType(typeId: 0)
class BookEntity{
   @HiveField(0)
  final String? bookId;
   @HiveField(1)
  final String? imageUrl;
   @HiveField(2)
  final String? title;
   @HiveField(3)
  final String? authorName;
   @HiveField(4)
  final num? rating;
   @HiveField(5)
  final num? downloadCount;
   @HiveField(6)
  final int? pageCount;
   @HiveField(7)
   String? previewLink;
   @HiveField(8)
   String? pdfLink;

  BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.downloadCount,
    required this.pageCount,
    required this.rating,
    this.pdfLink,
    this.previewLink,
  });
}