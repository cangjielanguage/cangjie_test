// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var b : Int32
    protected Data(){
        this.b = 3
    }    
}

class Data2 <: Data {
     
}


func run(): Int32 {
    var data: Data = Data() // EXPECTED: regex no matching constructor for call 'Data'

    return data.b - 3
}

func main(): Int64 {
    return Int64(run())
}

