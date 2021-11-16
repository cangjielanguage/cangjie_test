// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend Iterable<E> { // EXPECTED: regex-auto extending type 'Interface-Iterable<Generics-E>' is not allowed
    operator func ==(right:Char):Bool  {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}