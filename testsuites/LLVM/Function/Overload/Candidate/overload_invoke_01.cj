// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a = foo // EXPECTED: regex reference to overloaded function 'foo' could not be resolved
    var b = match (foo) {  // EXPECTED: regex reference to overloaded function 'foo' could not be resolved
        case x:()-> Unit => 1
        case x:(Int32)->Int64 => 0
        case x:(Int64)->Int64 => 3
        case _ => 4
    }
    if ( b != 0 ) {
        return 1
    }
    foo  // EXPECTED: regex reference to overloaded function 'foo' could not be resolved
    var c = match {
        case true => foo // EXPECTED: regex reference to overloaded function 'foo' could not be resolved
        case _ => foo // EXPECTED: regex reference to overloaded function 'foo' could not be resolved
    }
    return 0
}

external func foo(x:Int32){
    return Int64(x)
}

external func foo(x:Int64){
    return Int64(x)
}

external func foo(x:Int64,y:String){
    return Int64(x)
}
