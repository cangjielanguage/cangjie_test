// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f   pkga.%middle  -o %output
// EXEC: %run %run_opt %output %run_args


package pkgb
import pkga.*

func f(a: Int32) {print("f3")} // f3
record R {var a=2} // R2

func main() :Int64{

    f(1) // OK, invoke f3 in current package.
    f(true) // OK, invoke f2 in the imported package

    if(R().a==2){
        return 0
    }else{
        return 1
    } // OK, R2 shadows R1.
}
