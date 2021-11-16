package template_param_01
external open class MbTemplate { 
var buffer: StringStream = StringStream("")
public MbTemplate (
public var count: Int64) {
this.count = count
}
func setCountParam(count: Int64) {
this.count = count
}
public func render(): String {
appends(##"<html>
    <head>
        <meta charset="utf-8">
    </head>"##)

}

}
