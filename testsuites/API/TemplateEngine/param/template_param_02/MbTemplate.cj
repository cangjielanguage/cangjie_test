package template_param_02
external open class Template_param_02Template { 
var buffer: StringStream = StringStream("")
public Template_param_02Template (
public var age: Int64,
public var sex: String,
public var name: String) {
this.age = age
this.sex = sex
this.name = name
}
func setageParam(age: Int64) {
this.age = age
}
func setSexParam(sex: String) {
this.sex = sex
}
func setNameParam(name: String) {
this.name = name
}
public func render(): String {
appends(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

}

}
