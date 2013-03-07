import 'dart:html';
import '../lib/prettyprinter.dart';

void main() {
  PropertiesParser propertiesParser = new PropertiesParser();
  String properties = "test=test1\ntest2=test3";
  Properties result = propertiesParser.parse(properties);
  PropertiesPrettyPrinter ppp = new PropertiesPrettyPrinter();
  ppp.setTargetDivElement(query("#target"));
  ppp.print(result);
}