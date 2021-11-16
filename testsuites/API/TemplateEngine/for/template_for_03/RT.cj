package template_for_03
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
for (i in 1..2) {
for (i in 1..2) {
appendAll(##"print("for循环")
     "##)
}
}

return String(this.buffer.getChars())
}

}