% Generate a time vector 't' from 0 to 20 with increments of 0.11
t = 0:0.11:20;

% Generate the sine wave signal 'x' based on the time vector 't'
x = sin(t);

% Optionally plot the original sine wave 
% plot(x);

% Generate random noise 'n' with the same length as 't'
n = randn(1, length(t));

% Add the random noise to the sine wave to create a noisy signal 'x'
x = x + n;

% Prompt the user to input the number of points for the moving average filter
a = input('Enter the no.:');

% Create a vector 't2' of ones with length 'a'
t2 = ones(1, a);

% Define the numerator coefficients of the moving average filter
% The filter coefficients are averaged by dividing 't2' by 'a'
num = (1/a) * t2;

% Define the denominator coefficients of the filter (for a moving average filter, it's [1])
den = [1];

% Apply the moving average filter to the noisy signal 'x'
% The 'filter' function processes 'x' with the specified numerator and denominator coefficients
y = filter(num, den, x);

% Plot the noisy signal 'x' in blue
plot(x, 'b');

% Hold the current plot to overlay the filtered signal on the same graph
hold on;

% Plot the filtered signal 'y' in red with a line width of 2 for better visibility
plot(y, 'r', 'linewidth', 2);

% Add a legend to the plot to distinguish between the noisy and filtered signals
legend('Noisy signal', 'Filtered signal');
