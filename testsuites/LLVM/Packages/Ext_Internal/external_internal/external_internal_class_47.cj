// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 47}

external class A{
    private func foo(x:Aoo):Aoo{
        return x
    }
    func foo2(){foo}
}

func main(): Int64 {
    if(A().foo2()(Aoo()).value==47){
        return 0
    }else{
        return 1
    }
}
