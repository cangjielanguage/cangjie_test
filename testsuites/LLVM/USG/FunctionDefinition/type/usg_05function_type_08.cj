// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func identity<T>(a: T) { // identity is a generic function
    a
}
var b = identity // EXPECTED:regex error.*? generic type should be used with type argument

func main(){
    return 0
}
