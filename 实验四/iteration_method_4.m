%�����ݶȷ�
clc,clear;
%���庯������ز���
mf = @(x,y) 100*(y-x^2)^2+(1-x)^2;  % Ŀ�꺯�� f(x,y)
%�ݶȾ���
grad_mf = @(x,y) [-400*x.*(y - x.^2) - 2*(1 - x); 200*(y - x.^2)];

% ��������
n = 100;%n�ε�����Ϊһ��
x0 = [0; 0]; % ��ʼ��
maxIter = 1000; % ����������
tolerance = 1e-3; % ����

% ��ʼ��
x = x0;
% �����ݶȾ���
g = grad_mf(x(1), x(2));
k = 1;
%������������
d = -  g;

%�����������鲢��ͼ
array = [];
figure; % ��һ����ͼ�δ���

%��������
tic; % ��ʼ��ʱ
for iter = 1:maxIter
    %����d�Ķ�����
    mod_grad = norm(g);
    %�ж��Ƿ����ѭ��
    if mod_grad < tolerance
        break;
    else
        if k==n
            % �����ݶȾ���
            g = grad_mf(x(1), x(2));
            d = -g;
            k = 1;
            continue
        else
            %���ɶ�Ӧ������ڲ�����һԪ����
            lsf = @(lambda) mf(x(1)+lambda*d(1),x(2)+lambda*d(2));
            %�õ�lambda
            %lambda=fminunc(lsf);
            [lambda,~]=fminbnd(lsf,0,100);
            %��¼��ֵ
            g_old = g;
            %���³�ʼ��
            x(1) = x(1) + lambda * d(1);
            x(2) = x(2) + lambda * d(2);
           % �����ݶȾ���
           g= grad_mf(x(1), x(2));
           %��betaֵ������PRP��ʽ��
           beta = g' * (g - g_old) / (g_old' * g_old);
           %������������
           d = -g + beta * d;
           %����k
           k = k+1;
        end 
    end
    %����������
    array = [array,mf(x(1), x(2))];
    % ������ս��
    fprintf('�����ݶȷ�(PRP��ʽ)��%d�ε�����: x=%.4f, y=%.4f, f(x,y)=%.4f\n', iter,x(1), x(2), mf(x(1), x(2)));
end
%��ͼ
plot(1:iter-1,array,'r--o','LineWidth', 2);
grid on;
title('�����ݶȷ�(PRP��ʽ)', 'FontSize', 18); % ��ӱ���
xlabel('��������', 'FontSize', 18); % ��� x ���ǩ
ylabel('����ֵ', 'FontSize', 18); % ��� y ���ǩ

%���ʱ��
tElapsed = toc; % ������ʱ����ȡ������ʱ��
fprintf('����ִ��ʱ�䣺%.5f��\n', tElapsed);