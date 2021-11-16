package template_param_01
external open class Template_param_01Template {
var buffer: StringStream = StringStream("")
private func append(s: ToString) {
_result_.append(s.toString())
}
public Template_param_01Template (
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

