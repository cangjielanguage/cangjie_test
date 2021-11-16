// EXEC: %compiler %enableAD %cmp_opt %f -o %output

interface A {
    @differentiable[except:[y,this]]
    func b(y: Int64):Float32{
        return 1.0
    }
    @differentiable[except:[x, this]]
    func a(x:Int64):Float32{
        return b(x)
    }
}


func main(){
    return 0
}