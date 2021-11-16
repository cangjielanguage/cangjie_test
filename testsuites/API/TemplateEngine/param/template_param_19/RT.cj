package template_param_19
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll(##"param"##)

return String(this.buffer.getChars())
}

}