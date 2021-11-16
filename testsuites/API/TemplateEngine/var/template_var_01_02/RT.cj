package template_var_01_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
var x: String = "something" 234/$@gh
return String(this.buffer.getChars())
}
}
