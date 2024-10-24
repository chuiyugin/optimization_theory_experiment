%最速下降法
clc,clear;
%定义函数和相关参数
mf = @(x,y) 100*(y-x^2)^2+(1-x)^2;  % 目标函数 f(x,y)
% 梯度矩阵
grad_mf = @(x,y) [-400*x.*(y - x.^2) - 2*(1 - x); 200*(y - x.^2)];

% 参数设置
x0 = [0; 0]; % 初始点
maxIter = 1000; % 最大迭代次数
tolerance = 1e-2; % 精度

% 初始化
x = x0;

%创建数据数组并画图
array = [];
figure; % 打开一个新图形窗口

%迭代计算
tic; % 开始计时
for iter = 1:maxIter
    % 计算梯度
    gradient = grad_mf(x(1), x(2));
    %计算搜索方向
    d = - gradient;
    %计算d的二范数
    mod_d = norm(d);
    %判断是否结束循环
    if mod_d < tolerance
        break;
    else
        %生成对应方向关于步长的一元函数
        lsf = @(lambda) mf(x(1)+lambda*d(1),x(2)+lambda*d(2));
        %得到lambda
        %lambda=fminunc(lsf,0);
        [lambda,~]=fminbnd(lsf,0,10);
        %更新初始点
        x(1) = x(1) + lambda * d(1);
        x(2) = x(2) + lambda * d(2);
    end
    %更新数组结果
    array = [array,mf(x(1), x(2))];
    % 输出最终结果
    fprintf('最速下降法第%d次迭代后: x=%.4f, y=%.4f, f(x,y)=%.4f\n', iter,x(1), x(2), mf(x(1), x(2)));
end
%画图
plot(1:iter-1,array,'r--o','LineWidth', 2);
grid on;
title('最速下降法', 'FontSize', 18); % 添加标题
xlabel('迭代次数', 'FontSize', 18); % 添加 x 轴标签
ylabel('函数值', 'FontSize', 18); % 添加 y 轴标签

tElapsed = toc; % 结束计时并获取经过的时间
fprintf('程序执行时间：%.5f秒\n', tElapsed);