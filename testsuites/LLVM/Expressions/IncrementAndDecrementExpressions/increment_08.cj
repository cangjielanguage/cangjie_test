// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    return run()
}

open class Base{
    var c:Int32 = 2
}

class COO <: Base{
    var a: Int32 = 1
    var b: Int32 = 2
    operator func ++():Int32{ // EXPECTED: regex-auto illegal operator '++' for overloading
        this.a = this.a + 1
        return this.a
    }
}

func run(): Int64 {
    var coo: COO = COO()
    var res = coo++ 
    if (res != 2) { return 1}
    return 0
}
