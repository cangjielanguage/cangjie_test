// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

//class HashSet<T> <: Collection<T>  where T <: Hashable, T <: Equatable<T>
from std import collection.*

func main(): Int64 {
    return 0
}

extend HashSet<T> <: Hashable {     // EXPECTED: regex error.*?imported type 'HashSet' cannot extend import interface
   func hashCode() : UInt64{
       return 9
   }
}

extend HashSet<T> <: Equatable<HashSet<T>> {  // EXPECTED: regex error.*?imported type 'HashSet' cannot extend import interface
   operator func == (that: HashSet<T>): Bool {  // EXPECTED: regex error.*?instantiation 'HashSet<Generics-T>' causes ambiguous functions named '==' in declaration 'HashSet<Generics-T>'
            return false
       }
   operator func != (that: HashSet<T>): Bool {  // EXPECTED: regex error.*?instantiation 'HashSet<Generics-T>' causes ambiguous functions named '!=' in declaration 'HashSet<Generics-T>'
            return false
       }
}

