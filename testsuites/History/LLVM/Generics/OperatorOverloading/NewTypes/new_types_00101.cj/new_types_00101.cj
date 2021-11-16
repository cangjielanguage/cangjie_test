// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

func test<T>(a:T):T{a}
func foo(a:Int32):Int32{a}

trait update{
    operator func [](a:This,b:Bool):Bool
}

append foo with update { // EXPECTED: regex 'foo' is not a type
    operator func [](a:foo,b:Bool):Bool {true}
}

func main(): Int64 {
    return 1
}
