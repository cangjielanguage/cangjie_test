package template_func_10_01
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
func _fg(a: String): Int64 {
    print(a)
    return a.size()
}
return String(this.buffer.getChars())
}
}