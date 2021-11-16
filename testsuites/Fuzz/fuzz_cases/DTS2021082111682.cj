// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

@differentiable[include: []]
record A {
    var x : String
    @differentiable[except: [x]]
    t: [x]]
    t: [x]]
    t: [x]]
    t: [x]]
    func foo(x!:Float64 = 1.0){
        return 1.0
    }
}


func main(){
    return 1
