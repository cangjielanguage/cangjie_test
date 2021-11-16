package template_param_21_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var n中ame: String) {
this.n中ame = n中ame
}
func setN中ameParam(n中ame: String) {
this.n中ame = n中ame
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

return String(this.buffer.getChars())
}

}