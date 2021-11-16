// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main(): Int64 {
    case01()
    case02()
    case03()
    A().case01()
    A().case02()
    A().case03()
    C().case01()
    C().case02()
    C().case03()
    E().case01()
    E().case02()
    E().case03()
    return 0
}

func case01():()->Int64 // EXPECTED: regex error.*?function declaration must have function body

func case02() // EXPECTED: regex error.*?function declaration must have function body

func case03(){} // EXPECTED: regex-not error

abstract class A {
    func case01():()->Int64 // EXPECTED: regex-not error

    func case02() // EXPECTED: regex error.*?abstract function must have return type

    func case03(){} // EXPECTED: regex-not error
}

interface B {
    func case01():()->Int64 // EXPECTED: regex-not error

    func case02() // EXPECTED: regex error.*?abstract function must have return type

    func case03(){} // EXPECTED: regex-not error
}

class E implements B{}

record C {
    func case01():()->Int64 // EXPECTED: regex error.*?function declaration must have function body

    func case02() // EXPECTED: regex error.*?function declaration must have function body

    func case03(){} // EXPECTED: regex-not error
}
