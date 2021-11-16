package template_param_02
from std import io.*
external open class MbTemplate {
var buffer: StringStream = StringStream("")
private func appendAll(s: String) {
this.buffer.appends(s)
}
public MbTemplate (
public var age: Int64,
public var sex: String,
public var name: String) {
this.age = age
this.sex = sex
this.name = name
}
func setAgeParam(age: Int64) {
this.age = age
}
func setSexParam(sex: String) {
this.sex = sex
}
func setNameParam(name: String) {
this.name = name
}
public func render(): String {
appendAll(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)
return String(this.buffer.getChars())
}
}
