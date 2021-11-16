// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A{}

interface update{
    operator func *(b:This):Int32 // EXPECTED: regex error.*?'This' type is not allowed here
}

extend A <: update {
    func *(b:A):Int32 {return 1} 
}

extend Char <: update {
    func *(b:Char):Int32 {return 1}
}

func main():Int64{
    var a : Char = 'a'
    return 1
}
