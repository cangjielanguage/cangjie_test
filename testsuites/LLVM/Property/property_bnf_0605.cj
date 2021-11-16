// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    return 0
}

record Boo{
    prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    prop let n:Int32 {
        get(){
             return a
        }
    }
    var a:Int32 = 1 // a = 1
}

