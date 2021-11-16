// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    if ( case01() != 1 ) {
        return 1
    }
    return 0
}

func case01(){
    let score = 80
    let a = {70}
    let b = {}
    var c: B = match ({}) {
        case a => A() // EXPECTED: regex error.*?return type for 'init' is mismatched
        case _ => B()
    }
    return c.a
}

open class A {
    var a:Int32 = 1
}

class B <: A {
    var b:Int32 = 2
}
