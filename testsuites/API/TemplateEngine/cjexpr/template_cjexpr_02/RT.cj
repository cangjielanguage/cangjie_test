package template_cjexpr_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public func render(): String {
appendAll({ 
    #for(i in 1..100){
       print("#{i}")
       print(#{i})
    }
 }().toString())
return String(this.buffer.getChars())
}
}