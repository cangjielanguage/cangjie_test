// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

class Boo {
    @differentiable [except:[this]]
    func a(){
    }
}