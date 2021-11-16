// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

record Data<T>
    Where T <: Foo {  // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition
    let classBar: T1
    Data(x: T){
        classBar = x
    }
}

func main(): Int64 {
    let bar: Bar= Bar()
    let data: Data<Bar> = Data<Bar>(bar)
    return 0
}
