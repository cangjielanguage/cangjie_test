// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class A {
    // cj侧声明的默认值 无效
    A( var a1!: String, var a2!: Int64 = 1) {
    }
}

@JsObject
class B {
    B(var a1!: String, var a2!: A) {
    }
}

@JsRename["isMoment"]
@JsMember["./momentMember"]
foreign func nested03(obj:B) : String

unsafe func main() {
    let res = nested03(B( a1: "1", a2: A(a1: "2")))
    if (res != "12") {
        return 1
    }
    return 0
}
