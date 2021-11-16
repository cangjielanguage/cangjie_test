package template_var_02_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
var x%^^……&……&: String = "something"
return String(this.buffer.getChars())
}
}
