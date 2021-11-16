// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
    init() {}
}
class C <: A {
    private init() {
        super()
    }
    init(name: String, age: Int32) {
        this()
    }
}

func main(){

    return 0
}

