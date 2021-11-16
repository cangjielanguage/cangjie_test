package template_import_05
from std import io.*
import collection123
from stdx import mat123
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
return String(this.buffer.getChars())
}
}