package template_param_13
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var name\n&&*&*: String) {
this.name\n&&*&* = name\n&&*&*
}
func setName\n&&*&*Param(name\n&&*&*: String) {
this.name\n&&*&* = name\n&&*&*
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}
