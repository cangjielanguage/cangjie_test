// EXEC: %compiler %enableAD %cmp_opt %f -o %output

record A {
    
    func b(y: Float32){
        return y
    }

    @differentiable[except:[this, x]]
    func a(x:Float32):Float32{
        return b(x)
    }
}


func main(){
    return 0
}