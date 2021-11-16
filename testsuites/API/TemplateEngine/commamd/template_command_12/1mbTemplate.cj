package template_command_12
from std import io.*
external open class 1mbTemplate { 
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s) 
}
public func render(): String {
appendAll(##"func f(a: String): Int64 {
    print(a)
    return a.size()
}
"##)

return String(this.buffer.getChars())
}

}
