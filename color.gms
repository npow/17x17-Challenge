Sets
  i row /1*16/
  j column /1*16/
  color colors /1*4/
  ii(i) /1*16/
  jj(j) /1*16/;

Variables
  vc(i, j, color)    foo
  is_colrd(i, j)     bar
  z                  baz;

Binary variable vc(i,j,color);
Binary variable is_colrd(i,j);

Equations
  n_colrd          define objective function
  check1(i,j)      define check1
  check2(i,j)      define check2
  hmm(i,j,ii,jj,color)   asdf
  hmm2(i,j,ii,jj,color)   asdf2;

n_colrd.. z =e= sum((i,j), is_colrd(i,j));
check1(i,j).. sum((color), vc(i,j,color)) =l= 1;
check2(i,j).. is_colrd(i,j) =e= sum((color), vc(i,j,color));
hmm(i,j,ii,jj,color)$(ord(i)<>ord(ii) and ord(j)<>ord(jj)).. vc(i,j,color)+vc(ii,j,color)+vc(i,jj,color)+vc(ii,jj,color) =l= 3;
hmm2(i,j,ii,jj,color)$(ord(i)<>ord(ii) and ord(j)<>ord(jj)).. vc(i,j,color)+vc(ii,j,color)+vc(i,jj,color)+vc(ii,jj,color) =g= 0;

Model coloring /all/;

option iterlim = 9999999;
option reslim = 9999999;
option optcr = 0;
solve coloring using mip maximizing z; 

display z.l, z.m;
