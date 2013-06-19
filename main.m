%
% 毕设实验代码
%
format short;
target = jerk_target_generator();

% 位置显示
% subplot(2, 2, 1);
plot3(target(1, :), target(2, :), target(3, :), 'LineWidth', 2)

hold on
plot3(target(1, 1), target(2, 1), target(3, 1), 'ok', 'MarkerFaceColor','k')
text(target(1, 1), target(2, 1), target(3, 1) + 200, 'A')
hold on
plot3(target(1, 41), target(2, 41), target(3, 41), 'ok', 'MarkerFaceColor','k')
text(target(1, 41), target(2, 41), target(3, 41) + 200, 'B')
hold on
plot3(target(1, 71), target(2, 71), target(3, 71), 'ok', 'MarkerFaceColor','k')
text(target(1, 71) + 100, target(2, 71) + 100, target(3, 71) + 100, 'C')
hold on
plot3(target(1, 100), target(2, 100), target(3, 100), 'ok', 'MarkerFaceColor','k')
text(target(1, 100) - 100, target(2, 100), target(3, 100) + 200, 'D')

% plot3(target(1, 40), target(2, 40), target(3, 40), 'ok', 'LineWidth', 2)
% plot3(target(1, 70), target(2, 70), target(3, 70), 'ok', 'LineWidth', 2)
% plot3(target(1, 100), target(2, 100), target(3, 100), 'ok', 'LineWidth', 2)
grid on
xlabel('sx');
ylabel('sy');
zlabel('sz');

% 速度的变化图示
% subplot(2, 2, 2);
% plot(target(4, :))
% grid on
% xlabel('t');
% ylabel('vx');
% 
% subplot(2, 2, 3);
% plot(target(5, :))
% grid on
% xlabel('t');
% ylabel('vy');
% 
% subplot(2, 2, 4);
% plot(target(6, :))
% grid on
% xlabel('t');
% ylabel('vz');

