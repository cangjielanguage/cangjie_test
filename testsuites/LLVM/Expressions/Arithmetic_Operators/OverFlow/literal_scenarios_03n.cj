// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func foo<V>(a:V, b:String):V {
    return a
}

func foo<T>(a:T, b:Int8): T {
    return a
}


func main(): Int64 {
    foo<Int64>(3, 129)      // EXPECTED: regex  the number '129' exceeds the value range of type 'Int8'
    return 0
}