package template_while_02_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
while (x>5) {
for (i in 1..10) {
appendAll(##"print("for循环")
"##)
}
}

return String(this.buffer.getChars())
}

}