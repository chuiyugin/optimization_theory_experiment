clc,clear;
% ������ű���
%syms x
%���庯������ز���
mf = @(x) 3*x^3 - 4*x + 2;  % Ŀ�꺯�� f(x)
% f = exp(-x) + x^2;  % Ŀ�꺯�� f(x)
% f = 2*x^2 - x - 1;  % Ŀ�꺯�� f(x)

% ʹ�� fplot ���Ʒ��ű��ʽ��ͼ��
% fplot(f, [-5 5]) % ָ��x�᷶ΧΪ-5��5
% grid on; % ��ʾ����
% title('Graph of f(x)'); % ���ñ���
% xlabel('x'); % ����x���ǩ
% ylabel('f(x)'); % ����y���ǩ

% �����ű��ʽת��Ϊ��������
%mf = matlabFunction(f);
x1 = 0;%��ʼ��
h0 = 1;%��ʼ����
k = 2;%�����Ŵ���
max_iterations = 100;%����������

% ����Ҫ��
tolerance = 0.2;

%Ѱ�Ҽ�Сֵ��������
f1 = mf(x1);
f2 = mf(x1 + h0);
%ǰ������
if f1 > f2
    for i = 1:max_iterations
        f1_new = mf(x1 + h0 + h0*k*(i-1));
        f2_new = mf(x1 + h0 + h0*k*i);
        if f1_new <= f2_new  %�õ���ʼ������
            a = x1 + h0*k*(i-1);
            b = x1 + h0 + k*h0*i;
            break;
        end
    end
else %��������
    for i = 1:max_iterations
        f1_new = mf(x1 - h0*k*i);
        f2_new = mf(x1 - h0*k*(i-1));
        if f1_new >= f2_new  %�õ���ʼ������
            a = x1 - h0*k*i;
            b = x1 - h0*k*(i-1) + h0;
            break;
        end
    end
end
%disp(a);
%disp(b);

%0.618��
ma  = a;
mb = b;
c = ma + 0.382*(mb - ma);
d = ma + 0.618*(mb - ma);
for i = 1:max_iterations
    if mb - ma < tolerance
        my_ans = 0.5*(ma + mb);
        % ������
        fprintf('��0.618��%d�ε�����:\n',i);
        fprintf('��Сֵ��Ľ���ֵΪ: %.6f\n', my_ans);
        fprintf('������СֵԼΪ: %.6f\n', mf(my_ans));
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