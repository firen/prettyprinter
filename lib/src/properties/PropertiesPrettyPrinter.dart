part of prettyprinter;

class PropertiesPrettyPrinter {
  DivElement _targetDivElement;

  setTargetDivElement( DivElement targetDivElement ) {
    _targetDivElement = targetDivElement;
  }

  print( Properties properties ) {
    Iterator propertiesIterator = properties.getPropertiesIterator();
    while( propertiesIterator.moveNext() ) {
      Entity current = propertiesIterator.current;

      switch( current.getType() ) {
        case EntityTypes.PROPERTY:
          DivElement propertyDivElement = new DivElement();
          propertyDivElement.innerHtml = "${current.key}<span style='color:blue'>=</span>${current.value}";
          _targetDivElement.append(propertyDivElement);
          break;
        case EntityTypes.COMMENT:
          DivElement propertyDivElement = new DivElement();
          propertyDivElement.innerHtml = "<span style='color:green'>${current.comment}</span>";
          _targetDivElement.append(propertyDivElement);
          break;
      }

    }
  }
}