package template_if_04_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
if (x > 0) {
if (x>3) {
appendAll(##"<div><p> hello </p></div>
   "##)
}
else {
appendAll(##"print("嵌套条件1")
   "##)
}
}
else if (x>-9) {
if (y>8) {
appendAll(##"<a href="w3.huawei.com">click</a>
   "##)
}
else {
appendAll(##"print("嵌套条件2")
   "##)
}
}
else {
appendAll(##"print("多组条件1")
"##)
}
return String(this.buffer.getChars())
}
}
