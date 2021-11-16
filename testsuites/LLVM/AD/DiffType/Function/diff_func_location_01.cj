// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

@differentiable [except:[this]] // EXPECTED: regex error.*annotation on expressions other than function/record definition is not supported
interface Ioo {
    func a(){
    }
}

@differentiable // EXPECTED: regex error.*annotation on expressions other than function/record definition is not supported
interface Joo {
    @differentiable [except:[this]]
    func a(){
    }
}

