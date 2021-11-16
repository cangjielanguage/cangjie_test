package template_comment_03_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
var age:Int8=9
return String(this.buffer.getChars())
}
}
