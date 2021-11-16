package template_rawString_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll(##"<meta charset="utf-8">"##)

return String(this.buffer.getChars())
}

}