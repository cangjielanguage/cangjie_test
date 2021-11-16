// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: Float32 = 1.0976
                   var b: Float32 = 3.14
                   a * b
               }

    var pattern1 = match val1 {
        case _ : Float16 => 1
        case _ : Float32 => 2
        case _ : Float64 => 3
        case _ => 0
    }

    if val1-4.2376 >= 0.0001 || pattern1 != 2 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace