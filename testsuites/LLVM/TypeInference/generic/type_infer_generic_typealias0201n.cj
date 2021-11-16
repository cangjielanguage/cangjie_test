// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

type A2<T> = Foo<T> // EXPECTED: regex 'Foo' is not a type

func Foo<T>(x:Array<T>):Array<T>{
    var a = x
    return a
}

func run():Int64{
    var a:A2<Int64>
    return 0
}

func main(): Int64 {
    return run()
}
