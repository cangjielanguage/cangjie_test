// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f


@differentiable [include:[x]] record Doo { // EXPECTED: regex error.*'x' is not found in parameter list
    @differentiable [include:[]] func a(){
    }
}

@differentiable [except:[]] record Eoo {
    @differentiable [except:[y]] func a(){ // EXPECTED: regex error.*'y' is not found in parameter list
    }
}