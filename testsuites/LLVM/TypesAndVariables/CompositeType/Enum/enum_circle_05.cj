// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan StackOverflowError

enum TimeUnit {
    One(Data)
}

class Data {
    var time = TimeUnit.One(Data())
    var data:Int32 = 2
}


func main(): Int64 {
    var time = Data().time
    var res: Int32 = match (time) {
        case One(x) =>  x.data
        case _ => 5
    }

    if ( res == 2) {
        return 0
    }
    return 1

}
