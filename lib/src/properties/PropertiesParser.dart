part of prettyprinter;

class Comment extends Entity {
  String comment;
  
  getType() {
    return EntityTypes.COMMENT;
  }
}

class PropertiesParser {
  PropertiesTokenizer _tokenizer = new PropertiesTokenizer();

  Properties parse( String content ) {
    _tokenizer.load(content);
    Properties result = new Properties();
    while( _tokenizer.nextToken() ) {
      String token = _tokenizer.current();
      if( token.startsWith("#")) {
        result.addComment(handleComment(token));
      } else {
        result.addProperty(handleProperty(token));
      }
    }
    return result;
  }

  Property handleProperty( String token ) {
    List<String> keyValuePair = token.split("=");
    Property property = new Property();
    if( keyValuePair.length == 1 || keyValuePair.length == 2 ) {
      property.key = keyValuePair[0];
      if( keyValuePair.length == 2) {
        property.value = keyValuePair[1];
      }
      return property;
    } else {
      throw new Exception("Parser error: there should be one '=' in property line: $token");
    }
  }

  Comment handleComment( String token ) {
    Comment comment = new Comment();
    comment.comment = token;
    return comment;
  }
  
}

class EntityTypes {
  static const COMMENT = const EntityTypes._(0);
  static const PROPERTY = const EntityTypes._(1);

  static get values => [COMMENT, PROPERTY];

  final int value;

  const EntityTypes._(this.value);
}


abstract class Entity {
  getType();
}



class Property extends Entity {
  String key;
  String value;

  getType() {
    return EntityTypes.PROPERTY;
  }
}

class Properties {
  List<Entity> _properties = new List<Entity>();

  Iterator getPropertiesIterator() {
    return _properties.iterator;
  }

  addProperty(Property property) {
    _properties.add(property);
  }

  addComment( Comment comment ) {
    _properties.add(comment);
  }
}