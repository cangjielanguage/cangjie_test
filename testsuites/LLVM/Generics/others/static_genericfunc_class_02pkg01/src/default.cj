// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import pkga.Coo

func main(): Int64 {
    var i: Int32 = 3
    var a: Option<String> = Coo<String>.foo<Int32>(i)
    var res = match (a){
        case Some(x) => x
        case None => "No"
    }
    if ( res != "No" ){
        return 1
    }
    return 0
}
