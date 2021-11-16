// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

abstract class Coo {
    @differentiable [except:[this]]
    operator func +(x:Float64){
    }
}
