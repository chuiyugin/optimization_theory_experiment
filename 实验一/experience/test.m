clc,clear;
%题目1
% A=[ 1  0  0  3  -1  3;
%     0  1  0  2  -2  1;
%     0  0  1  -2  -1  2]; 
% b=[2 1 3]'; 
% c=[1 -2 3 -4  0  1]';

% A=[ 1  1  1  1  0  0;
%     2  1 -1  0  1  0;
%    -1  3  0  0  0  1]; 
% b=[12 6 9]'; 
% c=[-1 2 -1 0  0  0]';

% A=[ -1  2  1  0  0;
%     2  3   0  1  0;
%     1  -1  0  0  1]; 
% b=[4 12 3]'; 
% c=[-4  -1  0  0  0]';

%题目2
% A=[ 9  4  1  0  0;
%     4  5   0  1  0;
%     3  10  0  0  1]; 
% b=[360 200 300]'; 
% c=[-7  -12 0 0 0]';

%题目3（大M法）
M=2e32;
A=[ 3  2  1  6  18  -1   0 1 0 0;
    1  0.5  0.2  2  0.5  0  -1 0 1 0;
    0.5  1  0.2  2  0.8  0  0 0 0 1]; 
b=[700 30 200]'; 
c=[2 7 4 9  5  0 0 M M M]';

%例题
% A=[ -1  2  1  0  0;
%     2  3   0  1  0;
%     1  -1  0  0  1]; 
% b=[4 12 3]'; 
% c=[-4  -1 0 0 0]';

%大M法（题目1）
% M=2e32;
% A=[ 1  -2  1  1  0  0 0;
%     2  1  -4  0  -1 1 0;
%     1  0  -2  0  0  0 1]; 
% b=[11 3 1]'; 
% c=[1  1  -3  0  0 M  M]';

%大M法（题目2）
% M=2e32;
% A=[ 1  1  1  1  0  0  0;
%     -2  1  -1  0  -1 1 0;
%     0  3  1  0  0  0 1]; 
% b=[4 1 9]'; 
% c=[3  0  -1  0  0 M  M]';

[xm,fm,noi] = dcxf(A,b,c);
disp('最优解为：');
disp(xm);
disp('最优函数值为：');
disp(fm);
disp('迭代次数为：');
disp(noi);
