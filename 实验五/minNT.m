function [x, minf] = minNT(f, x0, var, eps)
    % ţ�ٷ����Ż�����
    % Ŀ�꺯�� f
    % ��ʼ�� x0
    % �Ա������� var
    % ���� eps
    % Ŀ�꺯��ȡ��Сֵʱ���Ա��� x
    % Ŀ�꺯����Сֵ minf

    syms x1 x2 % ������������������������Ը�����Ҫ���Ӹ���

    % ��ʼֵ
    x = x0;
    grad = gradient(f, var);
    H = hessian(f, var);

    while true
        % �����ݶȺ�Hessian����
        g = double(subs(grad, var, num2cell(x)));
        H_inv = inv(double(subs(H, var, num2cell(x))));

        % ���±���
        x_new = x - H_inv * g;
        
        % ����Ŀ�꺯��ֵ
        minf = double(subs(f, var, num2cell(x_new)));

        % �������
        if norm(x_new - x) < eps
            x = x_new;
            break;
        end
        
        x = x_new;
    end
end

