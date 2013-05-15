%
% 毕设实验代码
%
format short;
target = target_generator()

% 位置显示
subplot(2, 2, 1);
plot3(target(1, :), target(2, :), target(3, :))
grid on
xlabel('sx');
ylabel('sy');
zlabel('sz');

% 速度的变化图示
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

