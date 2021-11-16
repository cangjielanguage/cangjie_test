// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output


record A {
    var x : String
    @differentiable[except: [this, y]]
    func foo(x:Float64, y !: Float64 = x){
        return 1.0
    }
}


func main(){
    return 1
}