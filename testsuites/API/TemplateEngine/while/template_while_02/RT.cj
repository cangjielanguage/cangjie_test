package template_while_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
while (x>5) {
while (y>3) {
appendAll(##"print("嵌套while")
    "##)
}
}

return String(this.buffer.getChars())
}

}