// EXEC: %compiler %enableAD %cmp_opt %f -o %output

interface A {
    @differentiable[except:[x]]
    static func a(x:Int64):Float32
}


func main(){
    return 0
}