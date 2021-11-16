package template_import_0702
from std import io.*
from stdx
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
return String(this.buffer.getChars())
}
}
