// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    var c =  -(match(1){case _ =>A()}.a)++ // EXPECTED: regex error.*paren_expr is illegal before this increment or decrement expression
    if ( c != -1){
        return 1
    }
    return 0
}

class A{
    var a = 1
}
