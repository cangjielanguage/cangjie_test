// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

class A{
    @differentiable[except:[this]]// EXPECTED: regex-auto annotation on expressions other than function/record definition is not supported
    prop let s: String {
        get() {
        return ""
        }
    }
}

func main(){
    return 1
}