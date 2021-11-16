// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable // EXPECTED: regex annotation on expressions other than function/record definition is not supported
interface A {}

func main(){
    return 0
}