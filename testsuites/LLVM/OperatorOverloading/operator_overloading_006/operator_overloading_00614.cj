// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
class A{}

interface update{
    operator func *(b:This):Int32
}

extend A <: update {
    operator func *(b:A):Int32 // EXPECTED: regex function declaration must have function body
}

extend Char <: update {
    operator func  *(b:Char):Int32 // EXPECTED: regex function declaration must have function body
}

func main():Int64{
    var a : Char = 'a'
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
