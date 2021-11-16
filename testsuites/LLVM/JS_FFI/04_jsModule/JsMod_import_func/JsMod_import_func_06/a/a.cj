package a

@JavaScript
@JsModule["./momentModule"]
foreign class A{
	static func isMoment(arg: UInt32) : UInt32
}