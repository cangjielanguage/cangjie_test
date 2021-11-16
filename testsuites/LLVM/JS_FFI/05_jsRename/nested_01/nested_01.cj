// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class A {
    A(var a1_arg: String,var a2_arg: Int64) { }
}

@JsObject
class B {
    B(var a1: String, var a2: A) { }
}

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func nested01(obj:B) : String

unsafe func main() {
    let res = nested01(B( "1", A("2", 3)))
    if (res != "123") {
        return 1
    }
    return 0
}
