extension ListChunkExtension<T> on List<T> {
  List<List<T>> chunked(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be greater than 0');
    final chunks = <List<T>>[];
    for (var i = 0; i < this.length; i += size) {
      final end = (i + size < this.length) ? i + size : this.length;
      chunks.add(this.sublist(i, end));
    }
    return chunks;
  }
}
