// ERRCHECK: %compiler -config="(test=true)" %cmp_opt %f -o %output
// ASSERT:scan illegal nested when conditional compilation macro
@when[test=="true"]
@when[test!="true"]
func main(){0}
