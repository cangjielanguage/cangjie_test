// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    test()
    return 0
}

func test(){
    var x:Result<Int64> = Result<Int64>.Ok(100)
    var a:Map<Result<Int64>,Int64> = #{x:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c = #{x:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var d:Map<Result<Int64>,Int64>  = Map<Result<Int64>,Int64>(5,{x:Int64 =>(Result<Int64>.Ok(100),x) })  // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b =  a.get(Result<Int64>.Ok(100))
    return match (b){
        case Some(x) => x
        case None => 100
    }
}
