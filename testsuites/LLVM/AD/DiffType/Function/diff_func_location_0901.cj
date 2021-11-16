// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

class Aoo {
    func foo(){
        var a = {
            @differentiable [except:[this]]
            func goo(){} // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
        }
        if (true ){
            @differentiable [except:[this]]
            func goo(){} // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
        }
        while (true)  {
            @differentiable [except:[this]]
            func goo(){} // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
        }
        for ( i in 0..2:1){
            @differentiable [except:[this]]
            func goo(){} // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
        }
        match (1){
            case _ =>@differentiable [except:[this]]
                func goo(){} // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
        }
        var b = "${@differentiable [except:[this]]func goo(){}}" // EXPECTED: regex error.*Inner function 'goo' does not need @differentiable
    }
}