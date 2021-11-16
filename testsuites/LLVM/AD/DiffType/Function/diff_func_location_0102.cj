// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

interface Aoo {
    @differentiable [except:[this]]
    func a(){
    }
}