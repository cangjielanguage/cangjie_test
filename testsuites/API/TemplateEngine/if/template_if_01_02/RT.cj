package template_if_01_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
if (x > 0) {
appendAll(##"<div><p> hello </p></div>
"##)
}
else if (x>-9) {
appendAll(##"<a href="w3.huawei.com">click</a>
"##)
}
else {
appendAll(##"print("多组条件")
"##)
}
return String(this.buffer.getChars())
}
}

