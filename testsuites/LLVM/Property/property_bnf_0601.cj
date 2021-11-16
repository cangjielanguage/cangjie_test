// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    public prop let a1:Int64 {return 1} // EXPECTED: regex error.*?illegal prop member in prop block
}

class Coo <: Boo {
}

