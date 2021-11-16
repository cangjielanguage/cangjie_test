// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
    var a = 0
    func foo1(){return 0}
}

extend A{
    static func foo1(a: Int32){ //EXPECTED: regex static and non-static function 'foo1' cannot be overloaded
        return a
    }
}
    
func main(): Int64 {
    return 5
}