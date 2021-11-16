// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test():Result<Int64>{
    Ok(HashMap<Int64,Int64>([(1,1)]))??HashMap<Int64,Int64>([(1,1)])
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
