# Blow-up Cox Ring Generators

This repository contains Magma code to compute generators of the **Cox ring** of a blow-up of a projective variety along a subscheme.

## Files

- `library.m`: Contains the function `NewGens`, which computes generators and multiplicities of the Rees algebra (or Cox ring) associated to a blow-up.
- `example.m`: Computes the Cox ring of the blow-up of a smooth degree 5 hypersurface in `ℙ⁴` at a point, up to multiplicity 15.

## Function

### `NewGens(ide, I0, J, m)`

Computes generators of the Rees algebra of a blow-up.

**Parameters:**
- `ide`: ideal of the variety to be blown up.
- `I0`: ideal of the center of the blow-up.
- `J`: irrelevant ideal of the ambient projective space.
- `m`: compute generators up to multiplicity `m`.

**Returns:**
- `l`: list of generators.
- `m`: corresponding list of multiplicities.

## Example

The file `example.m` constructs a random degree 5 hypersurface in `ℙ⁴` over `𝔽₃₂₀₀₃` passing through a fixed point `p`, and computes the Cox ring of the blow-up of the hypersurface at `p`:

```magma
Q := GF(32003);
P<[x]> := ProjectiveSpace(Q, 4);

p := P![1,0,0,0,0];
L := LinearSystem(P, 5);
L1 := LinearSystem(L, [p], [1]);

f := &+[Random(Q)*s : s in Sections(L1)];

ide := Ideal(Cluster(P, p));
I0 := Ideal(f);
J := IrrelevantIdeal(P);

load "library.m";

l, m := NewGens(ide, I0, J, 15);
Sort(SetToSequence({ [Degree(l[i]), -m[i]] : i in [1..#m] }));
