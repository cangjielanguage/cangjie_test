// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class A {
    A( var a1!: String, var a2!: Int64) {
    }
}

@JsObject
class B {
    B(var a1!: String, var a2!: A) {
    }
}

@JsModule["./momentMember"]
foreign func isMoment(obj:B) : String

func main() {
    let res = isMoment(B( a1: "1", a2: A(a1: "2", a2: 3)))
    if (res != "123") {
        return 1
    }
    return 0
}
