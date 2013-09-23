%
% 第三章仿真实验 目标运动路线图
%

total_time = 500;
start_x = 100;
start_y = 1000;
current_time = 1;

sx = zeros(1, total_time);
sy = zeros(1, total_time);

% 第一阶段，匀速运动.（100m/s, 0m/s）持续时间200s
for t = 1:200
    sx(current_time) = start_x + 100 * current_time;
    sy(current_time) = start_y;
    current_time = current_time + 1;
end

% 第二阶段为匀加速运动，持续时间为50s，加速度为(2m/ss, 3m/ss)
% 当前位置
start_x = sx(200);
start_y = sy(200);
% 当前速度
current_vx = 100;
current_vy = 0;
% 当前加速度（2m/ss, 3m/ss）
ax = 2;
ay = 3;

for t = 1:50
    sx(current_time) = start_x + current_vx * t;
    sy(current_time) = start_y + current_vy * t;
    current_vx = current_vx + ax;
    current_vy = current_vy + ay;
    current_time = current_time + 1;
end

% 第三阶段，高机动，持续时间50s

% 当前位置
start_x = sx(250);
start_y = sy(250);
% 当前加速度（2m/ss, 3m/ss）
ax = 2;
ay = 3;
%　当前加加速度（0.015m/sss, -0.018m/sss）
aax = 0.015;
aay = -0.018;

for t = 1:50
    sx(current_time) = start_x + current_vx * t;
    sy(current_time) = start_y + current_vy * t;
    current_vx = current_vx + ax;
    current_vy = current_vy + ay;
    ax = ax + aax;
    ay = ay + aay;
    current_time = current_time + 1;
end

% 第四阶段，匀加速运动，持续100s
% 当前位置
start_x = sx(300);
start_y = sy(300);
% 当前加速度（-1m/ss, -1m/ss）
ax = -1.2;
ay = -1.4;

for t = 1:100
    sx(current_time) = start_x + current_vx * t;
    sy(current_time) = start_y + current_vy * t;
    current_vx = current_vx + ax;
    current_vy = current_vy + ay;
    current_time = current_time + 1;
end

% 第五个阶段为匀速运动
start_x = sx(400);
start_y = sy(400);

for t = 1:100
    sx(current_time) = start_x + current_vx * t;
    sy(current_time) = start_y + current_vy * t;
    current_time = current_time + 1;
end


plot(sx, sy, 'LineWidth', 2)
hold on

plot(sx(1), sy(1), 'ok', 'MarkerFaceColor','k')
text(sx(1), sy(1)+ 2000, 'A')
hold on

plot(sx(200), sy(200), 'ok', 'MarkerFaceColor','k')
text(sx(200), sy(200) + 2000, 'B')
hold on

plot(sx(250), sy(250), 'ok', 'MarkerFaceColor','k')
text(sx(250) - 1000, sy(250) + 2000, 'C')
hold on

plot(sx(300), sy(300), 'ok', 'MarkerFaceColor','k')
text(sx(300) - 1000, sy(300) + 2000, 'D')
hold on

plot(sx(400), sy(400), 'ok', 'MarkerFaceColor','k')
text(sx(400) - 1000, sy(400) + 2000, 'E')
hold on

plot(sx(500), sy(500), 'ok', 'MarkerFaceColor','k')
text(sx(500) - 1000, sy(500) - 2000, 'F')
hold on

grid on
xlabel('x(m)')
ylabel('y(m)')
