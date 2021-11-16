package template_comment_04
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll(##"//print("验证comment") "##)

return String(this.buffer.getChars())
}

}