// DEPENDENCE: test_10008.cj
// EXEC: %compiler -config="(test=false)" %cmp_opt -c test_10008.cj -o test_10008.%middle
// ERRCHECK: %compiler -config="(test=true)" %cmp_opt test_10008.%middle %f -o %output
// ASSERT: scan undeclared identifier 'foo'

@when[test=="true"]
import test.*

@when[test=="true"]
func bar(){return foo()}

@when[test=="true"]
func main(){bar()}