// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I<T> {
    let a : Option<T> = Option<T>.None
}

func main(){
    var i = I.a     // EXPECTED: regex generic type should be used with type argument
    return 0
}
