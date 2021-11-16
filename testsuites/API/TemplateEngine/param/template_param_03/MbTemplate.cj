package template_param_03
external open class MbTemplate { 
var buffer: StringStream = StringStream("")
public MbTemplate (
public var sex: String,
public var name: String) {
this.sex = sex
this.name = name
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
