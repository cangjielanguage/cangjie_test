// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Y{
let i = 1
}

class B <: Y{
static let a = super.i// EXPECTED: regex 'super' is not allowed to initialize static member
}

abstract class Z{
let i = 1
}

abstract class C <: Z{
static let a = super.i // EXPECTED: regex 'super' is not allowed to initialize static member
}

func main(){
return 1
}
