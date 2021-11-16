// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father<T> {    
}

class Child<T> <: Father<T>{
    var myData: T
    init(value:T){
        myData =  value
    }
}

func main(){
    var a:List<Father<Int64>> = [Child(1),Child(2)]
    var b = a.insertAll(0,[Child(6)])

    let a0_value = (b[0] as Child<Int64>).getOrThrow()
    let a1_value = (b[1] as Child<Int64>).getOrThrow()
    let a2_value = (b[2] as Child<Int64>).getOrThrow()

    if (a0_value.myData==6 && a1_value.myData==1 && a2_value.myData==2){
        return 0
    }
    return 1
}


