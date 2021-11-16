package template_for_05
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
for (i in 1..2) {
while (x>5) {
appendAll(##"print("while循环")
     "##)
}
}

return String(this.buffer.getChars())
}

}