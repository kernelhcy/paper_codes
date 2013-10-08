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
text(target(1, 1), target(2, 1), target(3, 1) + 2000, 'A')
hold on
plot3(target(1, 201), target(2, 201), target(3, 201), 'ok', 'MarkerFaceColor','k')
text(target(1, 201) - 1000, target(2, 201), target(3, 201) + 2000, 'B')
hold on
plot3(target(1, 351), target(2, 351), target(3, 351), 'ok', 'MarkerFaceColor','k')
text(target(1, 351) + 2000, target(2, 351) + 100, target(3, 351) + 1000, 'C')
hold on
plot3(target(1, 500), target(2, 500), target(3, 500), 'ok', 'MarkerFaceColor','k')
text(target(1, 500) - 1000, target(2, 500), target(3, 500) + 2000, 'D')

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

