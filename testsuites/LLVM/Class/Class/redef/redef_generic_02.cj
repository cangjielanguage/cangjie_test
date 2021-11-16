// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo<T> {
    static func foo<V>(x:T,y:V) where V <: Int32 {
        return y
    }
}

class Coo <: Boo<Int32> {
    redef static func foo<V>(x:Int32,y:V) where V <: Int64 {   // EXPECTED: regex redefine function 'foo' does not have an redefined 'static' function
        return y
    }
}
