part of prettyprinter;

class PropertiesPrettyPrinter {
  DivElement _targetDivElement;

  setTargetDivElement( DivElement targetDivElement ) {
    _targetDivElement = targetDivElement;
  }

  print( Properties properties ) {
    Iterator propertiesIterator = properties.getPropertiesIterator();
    int lineNumber = 0;
    
    TableElement codeTable = new TableElement();
    codeTable.classes = ["code-table"];
    
    while( propertiesIterator.moveNext() ) {
      Entity current = propertiesIterator.current;

      TableRowElement lineElement = new TableRowElement();
      lineElement.classes = ["line"];
      
      TableCellElement lineNumberElement = new TableCellElement();
      lineNumberElement.classes = ["line_no"];
      lineNumberElement.text = (lineNumber++).toString();
      lineElement.append(lineNumberElement);

      switch( current.getType() ) {
        case EntityTypes.PROPERTY:
          TableCellElement propertyDivElement = new TableCellElement();
          propertyDivElement.classes = ["line_content"];
          propertyDivElement.innerHtml = "${current.key}<span style='color:blue'>=</span>${current.value}";
          lineElement.append(propertyDivElement);
          break;
        case EntityTypes.COMMENT:
          TableCellElement propertyDivElement = new TableCellElement();
          propertyDivElement.classes = ["line_content"];
          propertyDivElement.innerHtml = "<span style='color:green;font-style:italic'>${current.comment}</span>";
          lineElement.append(propertyDivElement);
          break;
      }
      codeTable.append(lineElement);
    }
    _targetDivElement.append(codeTable);
  }
}