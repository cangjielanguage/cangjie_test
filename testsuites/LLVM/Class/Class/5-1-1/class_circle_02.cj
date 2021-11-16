// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan StackOverflowError

class Data{
    var rec:Rec = Rec()
}

record Rec{
    let data:Data = Data()
}

func main():Int64{
    Data()
    return 0
}
