// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest


external class A{
    let value = 0
}

external record B{
    var value2 =A().value
}

func foo (){
    if (B().value2==0){
        return 0
    }

    return 1
}

func main(): Int64 {
   return foo()
}
