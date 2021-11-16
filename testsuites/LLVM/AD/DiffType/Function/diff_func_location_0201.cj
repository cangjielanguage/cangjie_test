// EXEC: %compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

enum Eoo {
    A | B
    @differentiable
    func a(){ //EXPECTED: regex differentiable function a can't be defined in enum type
    }
}

