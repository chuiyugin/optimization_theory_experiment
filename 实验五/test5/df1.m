function g=df1(x)
g=[x(1)*x(2)^2*(x(3)+2)/(x(1)^2+(x(4)^2/pi^2))^0.5, ...
    2*(x(1)^2+(x(4)^2/pi^2))^0.5*(x(3)+2), ...
    x(2)^2*(x(1)^2+(x(4)^2/pi^2))^0.5, ...
    x(4)*x(2)^2*(x(3)+2)/(pi^2*(x(1)^2+(x(4)^2/pi^2))^0.5)]';