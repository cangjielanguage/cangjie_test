package template_param_21_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var nuy&*……%@ame: String) {
this.nuy&*……%@ame = nuy&*……%@ame
}
func setNuy&*……%@ameParam(nuy&*……%@ame: String) {
this.nuy&*……%@ame = nuy&*……%@ame
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}
