% Define the robot dimensions
L1 = 1; % Length of link 1
L2 = 1; % Length of link 2
d3 = 1; % Length of link 3
L4 = 1; % Length of link 4

% Define the DH parameters
a = [0 L1 L2 0];
alpha = [0 0 0 0];
d = [0 0 0 d3];
theta = [0 pi/2 -pi/2 0];

% Compute the D-H transformation matrix
T01 = dhTransform(theta(1), d(1), a(1), alpha(1));
T12 = dhTransform(theta(2), d(2), a(2), alpha(2));
T23 = dhTransform(theta(3), d(3), a(3), alpha(3));
T34 = dhTransform(theta(4), d(4), a(4), alpha(4));

% Compute the final transformation matrix between the end effector frame and the base frame
T04 = T01 * T12 * T23 * T34;

% Display the final transformation matrix
disp(T04);

% Plot the robot
figure;
hold on;
axis equal;
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
view([45,30]);
plot3([0,T01(1,4)],[0,T01(2,4)],[0,T01(3,4)],'r','LineWidth',2);
plot3([T01(1,4),T12(1,4)],[T01(2,4),T12(2,4)],[T01(3,4),T12(3,4)],'g','LineWidth',2);
plot3([T12(1,4),T23(1,4)],[T12(2,4),T23(2,4)],[T12(3,4),T23(3,4)],'b','LineWidth',2);
plot3([T23(1,4),T04(1,4)],[T23(2,4),T04(2,4)],[T23(3,4),T04(3,4)],'k','LineWidth',2);
scatter3(T04(1,4), T04(2,4), T04(3,4),'filled');
title('SCARA Robot');

