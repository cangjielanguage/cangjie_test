// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let v1 = Option<Int64>.Some(100)
    let v2 = Option<Int64>.None
    let r1 = v1 ?? 0
    let r2 = v2 ?? 0
    print("${r1}")  // output: 100
    print("${r2}")  // output: 0
    
    let v3 = Result<Int64>.Ok(100)
    let v4 = Result<Int64>.Err(Exception())
    let r3 = v3 ?? 0
    let r4 = v4 ?? 0
    print("${r3}")  // output: 100
    print("${r4}")  // output: 0
    return 0
     
}


