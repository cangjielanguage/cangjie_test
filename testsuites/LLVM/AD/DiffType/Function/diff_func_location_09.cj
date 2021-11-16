// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

class Aoo {
    func foo(){
        @differentiable [except:[this]]
        func goo(){} // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
    }
}