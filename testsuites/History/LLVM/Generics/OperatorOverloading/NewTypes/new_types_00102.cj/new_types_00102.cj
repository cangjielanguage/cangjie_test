// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

func test<T>(a:T):T{a}

trait update{
    operator func [](a:This,b:Bool):Bool
}

append test<Int32> with update { // EXPECTED: regex 'test' is not a type
    operator func [](a:test<Int32>,b:Bool):Bool {true}
}

func main(): Int64 {
    return 1
}
