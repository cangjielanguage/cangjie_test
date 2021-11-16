package template_param_08
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var name*@%^&*)(: String() {
this.name*@%^&*)( = name*@%^&*)(
}
func setName*@%^&*)(Param(name*@%^&*)(: String() {
this.name*@%^&*)( = name*@%^&*)(
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}
