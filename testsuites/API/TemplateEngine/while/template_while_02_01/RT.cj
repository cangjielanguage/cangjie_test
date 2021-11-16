package template_while_02_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
while (x>5) {
if (y>3) {
appendAll(##"print("嵌套if")
  "##)
}
}
return String(this.buffer.getChars())
}
}
