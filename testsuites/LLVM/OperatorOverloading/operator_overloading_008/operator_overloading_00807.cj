// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface update_int8{
    operator func + (b:Char):Int32
}

extend Int8 <: update_int8{
    operator func + (b:Char):Int32{return 1}
}

interface update_char<T>{
    operator func + (b:T):Int32
}

extend Char <: update_char<Char>{
    operator func + (b:Char):Int32{return 2}
}


func main():Int64{
    var a : Int8 = 1
    var b : Char = '1'
    a+b // EXPECTED:regex-auto ambiguous match for + overload function call
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
