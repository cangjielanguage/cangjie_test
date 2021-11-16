// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "Https:other.example.com/%2F/%2F/"
    let s = URL.parseRequestURI(i).getOrThrow()
    var d =s.toString()
    if( d != "https:other.example.com/%2F/%2F/"){
        return 1
    }
    return 0
}