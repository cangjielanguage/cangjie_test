// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

trait update{
    operator func [](a:This,b:Bool):Bool

}

append<T> bottom with update { // EXPECTED: regex undeclared type name 'bottom'
    operator func [](a:bottom,b:Bool):Bool {true}
}

func main(): Int64 {
    return 1
}
