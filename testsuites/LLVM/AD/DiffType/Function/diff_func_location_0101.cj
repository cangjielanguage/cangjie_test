// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

interface Boo {
    @differentiable [except:[this]]
    func a():Unit
}
