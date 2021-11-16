// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( A<String>().b != 0 ){
        return 1
    }
    return 0
}

class A<T>  {
    prop let a:Int64{
        get(){
            return 1
        }
    }
    var b = match (Data.T) {
        case $V => 1
        case _:T => 2 // A<T>,because shadow class T
        case x:Data => 0
        case $T => 3 // Data.T
        case _ => 5
    }
}

class T {}

enum Data{
    T | V
}