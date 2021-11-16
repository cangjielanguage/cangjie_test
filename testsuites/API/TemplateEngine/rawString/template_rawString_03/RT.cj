package template_rawString_03
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll(##"﻿if(x>5){
  print("多行string1#")
else{
  print("多行string2")
}"##)
return String(this.buffer.getChars())
}
}
