// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    test()
    return 0
}

func test(){
    var x:Option<Int64> = Option<Int64>.None
    var a:Map<Option<Int64>,Int64> = #{x:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c = #{x:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var d:Map<Option<Int64>,Int64>  = Map<Option<Int64>,Int64>(5,{x:Int64 =>(Option<Int64>.None,x) })  // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b =  a.get(Option<Int64>.None)
    return match (b){
        case Some(x) => x
        case None => 100
    }
}
