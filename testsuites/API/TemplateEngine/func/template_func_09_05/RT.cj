package template_func_09_05
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
func var name="name"
return String(this.buffer.getChars())
}
}