// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    test()
    return 0
}

func test(){
    var x:()->Int64 = foo
    var a:Map<()->Int64,Int64> = #{x:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var a:Map<()->Int64,Int64> = #{{1}:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c = #{x:1} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var d:Map<()->Int64,Int64>  = Map<()->Int64,Int64>(5,{x:Int64 =>(foo,x) })  // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b =  a.get(foo)
    return match (b){
        case Some(x) => x
        case None => 100
    }
}

func foo():Int64{}