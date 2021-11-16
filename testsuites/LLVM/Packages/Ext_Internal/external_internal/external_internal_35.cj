// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class A{var value = 35}

external record B{var value = 35}

external  var a:A*B =(A(),B())

func main(): Int64 {

    if(a[0].value==a[1].value){
        return 0
    }else{
        return 1
    }
}
