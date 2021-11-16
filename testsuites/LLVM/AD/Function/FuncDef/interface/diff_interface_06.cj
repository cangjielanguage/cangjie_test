// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

interface A {
    @differentiable[except:[this]]
    func a(x : Float32):Float32{
        return 1.0
    }
}

@differentiable
func a(x : Float32):Float32{
    return 1.0
}

func main(){
    return 0
}