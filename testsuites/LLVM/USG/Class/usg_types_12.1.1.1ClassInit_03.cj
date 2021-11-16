// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
    init(name: String) {}
}
class C <: A {
    init() {}  // EXPECTED: regex error.*?there is no non-parameter constructor in super class, please invoke super call explicitly
    init(name: String, age: Int32) {
        super(name) // OK
    }
}

func main(){
    var t = C()
    return 0
}

