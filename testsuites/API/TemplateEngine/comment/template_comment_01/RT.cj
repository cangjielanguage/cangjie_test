package template_comment_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll(##"<p> Description </p> "##)
return String(this.buffer.getChars())
}
}
