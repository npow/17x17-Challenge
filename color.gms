Sets
  i row index        /1*17/
  j column index     /1*17/
  c color            /1*4/
  ii(i) row index    /1*17/
  jj(j) column index /1*17/;

Variables
  vc(i,j,c) vc
  z z;

Binary variable vc(i, j, c);

Equations
  objfn Number of colored vertexes
  constraint1(i,j,ii,jj,c) No monochromatic rectangles
  constraint2(i,j) Each vertex has one and only one color;

objfn.. z =e= sum((i,j,c), vc(i,j,c));
constraint1(i,j,ii,jj,c)$(ord(i)<>ord(ii) and ord(j)<>ord(jj)).. vc(i,j,c)+vc(i,jj,c)+vc(ii,j,c)+vc(ii,jj,c) =l= 3;
constraint2(i,j).. sum((c), vc(i,j,c)) =e= 1;

Model coloring /all/;
option reslim = 999999999;
option optcr = 0;
solve coloring using mip maximizing z;
