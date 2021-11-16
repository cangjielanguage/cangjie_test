// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

class Data<T1>
    where V <: Foo {  // EXPECTED: regex  undeclared type name 'V'
    let classBar: T1
    init(x: T1){
        classBar = x
    }
}

func main(): Int64 {
    let bar: Bar= Bar()
    let data: Data<Foo> = Data<Foo>(bar)
    return 0
}
