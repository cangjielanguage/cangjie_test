// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
record b{
    var a : Float64
}

class A{
    @differentiable[except:[this]]
    func a(x: b){
        return x
    }
}


func main(){
    return 0
}