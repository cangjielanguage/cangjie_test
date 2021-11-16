package template_command_06
from std import io.*
external open class MbTemplate { 
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s) 
}
public func render(): String {
appendAll(##"func f(a: String): Int64 {
    print(a)
    functi ansddddd
}
"##)

return String(this.buffer.getChars())
}

}
