package template_if_01_05
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
if (x > 0) {
for (i in 0..10) {
appendAll(##"<div><p> hello </p></div>
   "##)
}
}
return String(this.buffer.getChars())
}
}
