// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func returnAB(a: Int32, b: Int32): Int32*Int32 {
    (a, b)
}

func main(){
    if(returnAB(3,4)[0]==3 && returnAB(3,4)[1]==4 ){
        return 0
    }else{
        return 1
    }
}
