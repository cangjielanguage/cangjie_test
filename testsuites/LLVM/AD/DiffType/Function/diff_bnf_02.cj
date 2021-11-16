// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

@differentiable record Coo {
    @differentiable func a(){
    }
}

@differentiable [include:[]] record Doo {
    @differentiable [include:[]] func a(){
    }
}

@differentiable [except:[]] record Eoo {
    @differentiable [except:[]] func a(){
    }
}
