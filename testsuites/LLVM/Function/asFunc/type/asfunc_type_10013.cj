// ERRCHECK: %compiler %cmp_opt %f -o %output

record A<T>{
    private operator func ()(input:T){}
    func test(input:T){
        var a : A<T> = A<T>()
        a(input)
    }
}

func main(){
    var a : A<Int64> = A<Int64>()
    a(1) // EXPECTED: regex-auto no matching function for operator '()' function call
    return 0
}