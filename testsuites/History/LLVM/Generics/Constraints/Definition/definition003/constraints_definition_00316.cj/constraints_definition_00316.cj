// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class q{}
class w{}
class e{}
class r{}
class t{}
class y{}
class u{}
class i{}
class o{}
class p{}
class a{}
class s{}
class d{}
class f{}
class g{}
class h{}
class j{}
class k{}
class l{}
class z{}
class x{}
class c{}
class v{}
class b{}
class n{}
class m{}

func test<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M>() where
Q<:q,W<:w,E<:e,R<:r, T<:t, Y<:y, U<:u, I<:i, O<:o, P<:p, A<:a, S<:s, D<:d, F<:f, G<:g, H<:h, J<:j, K<:k, L<:l, Z<:z, X<:x, C<:c, V<:v, B<:b, N<:n,M<:m{}

record Rec<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M> where
Q<:q,W<:w,E<:e,R<:r, T<:t, Y<:y, U<:u, I<:i, O<:o, P<:p, A<:a, S<:s, D<:d, F<:f, G<:g, H<:h, J<:j, K<:k, L<:l, Z<:z, X<:x, C<:c, V<:v, B<:b, N<:n,M<:m{}

enum E<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M> where
Q<:q,W<:w,E<:e,R<:r, T<:t, Y<:y, U<:u, I<:i, O<:o, P<:p, A<:a, S<:s, D<:d, F<:f, G<:g, H<:h, J<:j, K<:k, L<:l, Z<:z,
X<:x, C<:c, V<:v, B<:b, N<:n,M<:m{E}

class C<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M> where
Q<:q,W<:w,E<:e,R<:r, T<:t, Y<:y, U<:u, I<:i, O<:o, P<:p, A<:a, S<:s, D<:d, F<:f, G<:g, H<:h, J<:j, K<:k, L<:l, Z<:z, X<:x, C<:c, V<:v, B<:b, N<:n,M<:m{}

interface I<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M> where
Q<:q,W<:w,E<:e,R<:r, T<:t, Y<:y, U<:u, I<:i, O<:o, P<:p, A<:a, S<:s, D<:d, F<:f, G<:g, H<:h, J<:j, K<:k, L<:l, Z<:z, X<:x, C<:c, V<:v, B<:b, N<:n,M<:m{}

trait R_X{}
append<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M> Rec<Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M> with R_X where
Q<:q,W<:w,E<:e,R<:r, T<:t, Y<:y, U<:u, I<:i, O<:o, P<:p, A<:a, S<:s, D<:d, F<:f, G<:g, H<:h, J<:j, K<:k, L<:l, Z<:z, X<:x, C<:c, V<:v, B<:b, N<:n,M<:m{}

func main():Int64{
    return 0
}
