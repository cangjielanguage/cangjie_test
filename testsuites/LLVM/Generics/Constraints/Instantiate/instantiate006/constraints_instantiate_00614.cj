// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
interface B<T> where T<:A<Map<T>>,
T<:A<Set<T>>,
T<:A<List<T>>{}

class Map<T> {}
class Set<T> {}
class List<T> {}

class C <: A<Map<C>> & A<Set<C>> & A<List<C>> & B<C> {}

func main():Int64{
    return 0
}
