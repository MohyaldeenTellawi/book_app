// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Book_Entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      bookId: fields[0] as String?,
      imageUrl: fields[1] as String?,
      title: fields[2] as String?,
      authorName: fields[3] as String?,
      downloadCount: fields[5] as num?,
      pageCount: fields[6] as int?,
      rating: fields[4] as num?,
      pdfLink: fields[8] as String?,
      previewLink: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.authorName)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.downloadCount)
      ..writeByte(6)
      ..write(obj.pageCount)
      ..writeByte(7)
      ..write(obj.previewLink)
      ..writeByte(8)
      ..write(obj.pdfLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
