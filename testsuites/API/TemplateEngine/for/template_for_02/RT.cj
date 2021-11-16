package template_for_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
for (i in 1..10) {
if (i > 5) {
appendAll(##"<p> "##)
appendAll({ i }().toString())
appendAll(##"</p>
     "##)
}
}
return String(this.buffer.getChars())
}
}
