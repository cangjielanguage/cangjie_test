// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

@differentiable[except: [x]]
record A {
    var x : String
    @differentiable[except: [x]]
    func foo(x!:Float64 = 1.0){
        return 1.0
    }
}


func main(){
    return 1
}