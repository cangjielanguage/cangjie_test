package template_import_03_01
from std import io.*
import collection#fail
from stdx import mat#fail
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
return String(this.buffer.getChars())
}
}
