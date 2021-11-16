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

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func nested04(obj:B) : String

unsafe func main() {
    let res = nested04(B( a1: {a()}(), a2: A(a1: b())))
    if (res != "12") {
        return 1
    }
    return 0
}

func a(){
    return "1"
}

func b(){
    return "2"
}
