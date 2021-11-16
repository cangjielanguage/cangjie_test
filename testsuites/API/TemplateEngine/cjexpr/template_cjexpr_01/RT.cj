package template_cjexpr_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll({ 
  doSomething {
    print("hello")
  }
 }().toString())
return String(this.buffer.getChars())
}
}