function dgi=dg1(x)
    dgi=[1, -1, 0, 0;
         -1, -1, 0, 0;
         0, 2, x(4), x(3);
         0, -2, -x(4), -x(3);
         -x(4)/(pi*x(1)^2*(1+(x(4)/(pi*x(1)))^2)), 0, 0, 1/(pi*x(1)*(1+(x(4)/(pi*x(1)))^2));
         x(4)/(pi*x(1)^2*(1+(x(4)/(pi*x(1)))^2)), 0, 0, -1/(pi*x(1)*(1+(x(4)/(pi*x(1)))^2));
          4200/((x(1)-x(2))^2*pi*x(2)^2), 6888/(pi*x(2)^3)-(-5600*pi*x(2)^3+4200*(4*x(1)-x(2))*x(2)^2)/(pi^2*x(2)^6*(x(1)-x(2))), 0, 0]';