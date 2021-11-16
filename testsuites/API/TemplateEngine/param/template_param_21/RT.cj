package template_param_21
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var @123name: String) {
this.@123name = @123name
}
func set@123nameParam(@123name: String) {
this.@123name = @123name
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}
