%
% ����ʵ�����
%
format short;
target = target_generator()

% λ����ʾ
subplot(2, 2, 1);
plot3(target(1, :), target(2, :), target(3, :))
grid on
xlabel('sx');
ylabel('sy');
zlabel('sz');

% �ٶȵı仯ͼʾ
subplot(2, 2, 2);
plot(target(4, :))
grid on
xlabel('t');
ylabel('vx');

subplot(2, 2, 3);
plot(target(5, :))
grid on
xlabel('t');
ylabel('vy');

subplot(2, 2, 4);
plot(target(6, :))
grid on
xlabel('t');
ylabel('vz');

