package template_func_01_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
func f(a: String,b:Int64) {
    print(a)
}
return String(this.buffer.getChars())
}
}