% Clear the command window
clc;

% Remove all variables from the workspace
clear all;

% Close all figure windows
close all;

% Disable warnings to avoid cluttering the output
warning off;

% Create a webcam object to access the webcam
c = webcam;

% Start an infinite loop to continuously capture and display video
while true
    % Capture a snapshot from the webcam
    e = snapshot(c);
    
    % Display the captured image in a figure window
    imshow(e);
    
    % Update the figure window with the new image
    drawnow;
end

% Release the webcam object and clear it from memory
clear c;
