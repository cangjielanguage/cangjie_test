// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[except: [this]]  
record A { // EXPECTED: regex-auto 'this' is not found in parameter list
    var x : String
    @differentiable[except: [x]]
    func foo(x!:Float64 = 1.0){
        return 1.0
    }
}


func main(){
    return 1
}