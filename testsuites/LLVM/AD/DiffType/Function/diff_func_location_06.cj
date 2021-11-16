// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

@differentiable [except:[this]] // EXPECTED: regex error.*annotation on expressions other than function/record definition is not supported
class Aoo {
    func a(){
    }
}