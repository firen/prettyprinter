part of prettyprinter;

class PropertiesTokenizer {
  String _content;
  List _tokens;
  Iterator _tokensIterator;

  load( String content ) {
    _content = content;
    _tokens = _content.split("\n");
    _tokensIterator = _tokens.iterator;
  }

  bool nextToken() {
    return _tokensIterator.moveNext();
  }

  String current() {
    return _tokensIterator.current;
  }
}
