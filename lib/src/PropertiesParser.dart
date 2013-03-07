part of prettyprinter;

class PropertiesParser {
  PropertiesTokenizer _tokenizer = new PropertiesTokenizer();

  Properties parse( String content ) {
    _tokenizer.load(content);
    Properties result = new Properties();
    while( _tokenizer.nextToken() ) {
      String token = _tokenizer.current();
      List<String> keyValuePair = token.split("=");
      Property property = new Property();
      if( keyValuePair.length == 1 || keyValuePair.length == 2 ) {
        property.key = keyValuePair[0];
        if( keyValuePair.length == 2) {
          property.value = keyValuePair[1];
        }
        result.addProperty(property);
      } else {
        throw new Exception("Parser error: there should be one '=' in property line: $token");
      }
    }
    return result;
  }
}

class Property {
  String key;
  String value;
}

class Properties {
  List<Property> _properties = new List();

  Iterator getPropertiesIterator() {
    return _properties.iterator;
  }

  addProperty(Property property) {
    _properties.add(property);
  }
}