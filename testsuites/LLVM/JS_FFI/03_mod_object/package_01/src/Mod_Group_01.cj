import a.*

@JsModule["./momentMember"]
foreign func isMoment(obj:Complex) : UInt32

 func main() {
    let res = isMoment(Complex(
        bo: false,
        str: "true",
        num: 0,
        fun: { data: Int64 => return data }
    ))
    if (res != 0) {
        return 1
    }
    return 0
}
