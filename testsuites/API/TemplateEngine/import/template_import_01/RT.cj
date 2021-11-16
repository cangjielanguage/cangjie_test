package template_import_01
from std import io.*
import collection
from math import math.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
return String(this.buffer.getChars())
}

}