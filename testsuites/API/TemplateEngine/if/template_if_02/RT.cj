package template_if_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
if (x > 0) {
appendAll(##"<div><p> hello </p></div>
print("多组条件1")
"##)
}
return String(this.buffer.getChars())
}
}
