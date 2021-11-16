package template_var_01_07
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
var xy: String = "something#"
return String(this.buffer.getChars())
}
}
