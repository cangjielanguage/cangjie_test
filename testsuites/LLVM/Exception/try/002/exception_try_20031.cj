// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The type of this catch block is 'Bool', which mismatches the smallest common supertype 'Int64' of previous branches.

open class A0 <: Exception{}
open class A1 <: A0{}
open class A2 <: A1{}
open class A3 <: A2{}
open class A4 <: A3{}
open class A5 <: A4{}


func main(){
    try {Int64(1)}
    catch (_:A5) {true}
    catch (_:A4) {(1,1)}
    catch (_:A3) {Float64(1)}
    catch (_:A2) {()}
    catch (_:A1) {"a"}
    catch (_:A0) {'a'}
    finally{}
    return 0
}