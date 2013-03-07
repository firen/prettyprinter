part of prettyprinter;

class PropertiesPrettyPrinter {
  DivElement _targetDivElement;

  setTargetDivElement( DivElement targetDivElement ) {
    _targetDivElement = targetDivElement;
  }

  print( Properties properties ) {
    Iterator propertiesIterator = properties.getPropertiesIterator();
    while( propertiesIterator.moveNext() ) {
      Property current = propertiesIterator.current;
      DivElement propertyDivElement = new DivElement();
      propertyDivElement.innerHtml = "${current.key}=<span style='color:green'>${current.value}</span>";
      _targetDivElement.append(propertyDivElement);
    }
  }
}