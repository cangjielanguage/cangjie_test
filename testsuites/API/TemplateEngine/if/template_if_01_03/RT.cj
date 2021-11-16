package template_if_01_03
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
if (x > 0) {
appendAll(##"<div><p> hello </p></div>
    <a href="w3.huawei.com">click</a>
"##)
}
return String(this.buffer.getChars())
}
}
