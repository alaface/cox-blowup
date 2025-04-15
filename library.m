// Given an ideal 'ide' and auxiliary ideals I0 and J,
// this function computes generators of the Rees algebra up to degree 'd'
NewGens := function(ide, I0, J, d)
    I := [ide + I0];
    lis := MinimalBasis(Saturation(I[1]));
    mul := [1 : i in [1..#lis]];

    for n in [2..d] do
        Append(~I, Saturation(I[1]^n + I0, J));
        sumIdeal := &+[I[i] * I[n - i] : i in [1..Floor(n/2)]] + I0;
        new := [p : p in NormalForm(Basis(I[n] + I0), sumIdeal) | p ne 0];
        lis := lis cat new;
        mul := mul cat [n : i in [1..#new]];
    end for;

    return lis, mul;
end function;
