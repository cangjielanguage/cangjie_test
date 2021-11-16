package template_import_04
from std import io.*
import collection中
from stdx import mat中
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
return String(this.buffer.getChars())
}
}