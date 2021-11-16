package template_for_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
for (i in 1..10) {
appendAll(##"print("${i}")
"##)
}

return String(this.buffer.getChars())
}

}