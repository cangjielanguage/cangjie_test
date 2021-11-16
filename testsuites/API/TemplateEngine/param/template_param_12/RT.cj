package template_param_12
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var name: *&\n&*&*|\r2fd"”) {
this.name = name
}
func setNameParam(name: *&\n&*&*|\r2fd"”) {
this.name = name
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}