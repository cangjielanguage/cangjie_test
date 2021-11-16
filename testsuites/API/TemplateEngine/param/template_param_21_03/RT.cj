package template_param_21_03
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var na_123me: String) {
this.na_123me = na_123me
}
func setNa_123meParam(na_123me: String) {
this.na_123me = na_123me
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}