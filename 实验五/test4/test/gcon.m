function g=gcon(x)
g=[
    22-x(1)+x(2)
    x(1)+x(2)-42
    110-0.4*x(1)*x(3)-2*x(2)
    0.4*x(1)*x(3)+2*x(2)-130
    (1.66*5600*x(1)^0.84)/(pi*x(2)^2.84)-785
];