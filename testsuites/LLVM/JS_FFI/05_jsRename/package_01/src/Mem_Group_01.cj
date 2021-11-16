import a.*

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func package01(obj:Complex) : UInt32

unsafe func main() {
    let res = package01(Complex(
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
