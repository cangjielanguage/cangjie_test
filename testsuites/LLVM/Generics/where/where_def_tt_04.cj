// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<:T<T> { // EXPECTED: regex error.*type argument's number does not match type parameter's number

}

class B<T> where T<:B<T> { // EXPECTED: regex-not error

}

func main() {
   var a = Aoo<B<Int32>>() // EXPECTED: regex error.*generics type arguments do not match the constraint
   return 0
}
