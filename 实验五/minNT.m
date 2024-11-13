function [x, minf] = minNT(f, x0, var, eps)
    % 牛顿法最优化函数
    % 目标函数 f
    % 初始点 x0
    % 自变量向量 var
    % 精度 eps
    % 目标函数取最小值时的自变量 x
    % 目标函数最小值 minf

    syms x1 x2 % 假设我们有两个变量，你可以根据需要增加更多

    % 初始值
    x = x0;
    grad = gradient(f, var);
    H = hessian(f, var);

    while true
        % 计算梯度和Hessian矩阵
        g = double(subs(grad, var, num2cell(x)));
        H_inv = inv(double(subs(H, var, num2cell(x))));

        % 更新变量
        x_new = x - H_inv * g;
        
        % 计算目标函数值
        minf = double(subs(f, var, num2cell(x_new)));

        % 检查收敛
        if norm(x_new - x) < eps
            x = x_new;
            break;
        end
        
        x = x_new;
    end
end

