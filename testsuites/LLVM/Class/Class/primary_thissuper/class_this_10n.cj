// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan StackOverflowError

class Data<T> {
    var a: T
    var b: T
    Data(y:T, str:String){
        a = y
        b = y
    }
    init(a: T){
        this(a,"hi")
        this.a = a
        b = this.a
        this + this
    }

    operator func +(right: Data<T>): Data<T> {
        Data<T>(right.b)
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(4)
    var res1: Int32 = data.a
    var res2: Int32 = data.b
    if(res1==4 && res2 == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
