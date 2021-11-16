// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

class A {
    
    func b(y: Float64){
        return y
    }

    @differentiable[except:[this, x]]
    func a(x:Float64):Float64{
        return b(x)
    }
}


func main(){
    return 0
}