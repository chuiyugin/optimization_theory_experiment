clc,clear;
% 定义符号变量
%syms x
%定义函数和相关参数
mf = @(x) 3*x^3 - 4*x + 2;  % 目标函数 f(x)
% f = exp(-x) + x^2;  % 目标函数 f(x)
% f = 2*x^2 - x - 1;  % 目标函数 f(x)

% 使用 fplot 绘制符号表达式的图像
% fplot(f, [-5 5]) % 指定x轴范围为-5到5
% grid on; % 显示网格
% title('Graph of f(x)'); % 设置标题
% xlabel('x'); % 设置x轴标签
% ylabel('f(x)'); % 设置y轴标签

% 将符号表达式转换为匿名函数
%mf = matlabFunction(f);
x1 = 0;%初始点
h0 = 1;%初始步长
k = 2;%步长放大倍数
max_iterations = 100;%最大迭代次数

% 精度要求
tolerance = 0.2;

%寻找极小值所在区间
f1 = mf(x1);
f2 = mf(x1 + h0);
%前进运算
if f1 > f2
    for i = 1:max_iterations
        f1_new = mf(x1 + h0 + h0*k*(i-1));
        f2_new = mf(x1 + h0 + h0*k*i);
        if f1_new <= f2_new  %得到初始化区间
            a = x1 + h0*k*(i-1);
            b = x1 + h0 + k*h0*i;
            break;
        end
    end
else %后退运算
    for i = 1:max_iterations
        f1_new = mf(x1 - h0*k*i);
        f2_new = mf(x1 - h0*k*(i-1));
        if f1_new >= f2_new  %得到初始化区间
            a = x1 - h0*k*i;
            b = x1 - h0*k*(i-1) + h0;
            break;
        end
    end
end
%disp(a);
%disp(b);

%0.618法
ma  = a;
mb = b;
c = ma + 0.382*(mb - ma);
d = ma + 0.618*(mb - ma);
for i = 1:max_iterations
    if mb - ma < tolerance
        my_ans = 0.5*(ma + mb);
        % 输出结果
        fprintf('在0.618法%d次迭代后:\n',i);
        fprintf('最小值点的近似值为: %.6f\n', my_ans);
        fprintf('函数最小值约为: %.6f\n', mf(my_ans));
        break;
    end
    if mf(c) > mf(d)
        ma = c;
        c = d;
        d = ma + 0.618*(mb - ma);
    else
        mb = d;
        d = c;
        c = ma + 0.382*(mb - ma);
    end
end