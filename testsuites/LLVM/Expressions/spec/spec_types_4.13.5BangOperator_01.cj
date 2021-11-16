// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    var item: Int64 = 100 
}

func main(): Int64 {
    let c = C()
    func f1(): Result<Int64> {
        let c1 = Result<C>.Ok(c)
        let r1 = c1!.item  // r1 = 100
        return Result<Int64>.Ok(r1)
    }
    func f2(): Result<Int64> {
        let err = Exception()
        let c2 = Result<C>.Err(err)
        let r2 = c2!.item  // return Result<Int64>.Err(err)
        return Result<Int64>.Ok(r2)
    }
    return 0
     
}


