PCS 130 Lab 5 Interference and Diffraction of Light
In this lab we will be looking at the interference and diffraction of light. 
Simulate the interference pattern and diffraction pattern of light through a single slit and double slit.
Analyze the relationship between the slit width and slit separation on the diffraction and interference pattern of light.
Determine the wavelength of a laser based on the diffraction pattern.

Simulating the diffraction pattern using a single slit
Often times before you perform an experiment you can simulate what might be expected based off of theory. In the below code block adjust the slit width, wavelength, screen size and distance to the screen based on your experimental set-up for a single slit trial. Generate a line plot of the intensity of the light on the screen as well as a visual simulation of the interference pattern.
% a = ; %Slit width in m
% l = ; % Estimated wavelength of your laser. Note that the colour of the laser is red. What range of wavelengths does the colour red fall under? 	
% D = ; % Distance to the screen in m
% x = -.02:.0001:.02; %Screen Size - Range of values to plot against for the position on the screen, middle number denotes resolution

% beta=pi*a/l.*x;
% intensity_single = (sin(beta+eps)./(beta+eps)).^2; %intensity of the light, eps is machine epsilon a small number added to beta for plotting purposes
% x1 = x*D*1000; %actual position on the screen
% plot(x1,intensity_single)
% title('Diffraction pattern from a an unknown laser');
% xlabel('Position on Screen [mm]')
% ylabel('Intensity');

% %Diffraction pattern on screen
% [x2, y2] = meshgrid(x1,[-1,1]);
% z2 = [intensity_single.^0.25; intensity_single.^0.25]; %Here this value is raised to 0.25 to help scale and visualize the lower intensities
% pcolor(x2, y2, z2)
% shadingMap = gray(64);
% colormap(shadingMap(:,1).*[0.8,0,0]);
% shading interp

Simulating the interference pattern using a double slit
For the interference pattern using a double slit we can use a similar calculation for the diffraction pattern from the single slit, then factor in the interference. In the code block below, enter in the slit separation you are interested in. Uncomment the relevant lines of code in order for the script to run.
%d_sep =  %slit separation input the slit separation value to simulate
%alpha = (pi*d_sep/D)/(l).*x;
%intensity_double = intensity_single.*cos(alpha).^2 ;

% Line plot of the double slit intensity interference and diffraction
% pattern
%plot(x1,intensity_double)
%hold on
%plot(x1,intensity_single,'--')
%legend('Interference Pattern','Diffraction envelope')
%title('Interference and Diffraction pattern from an unknown laser');
%xlabel('Position on Screen [mm]')
%ylabel('Intensity');
%hold off

%Projected pattern on a sheet. Uncomment the lines below.
%[x2, y2] = meshgrid(x1,[-1,1]);
%z3 = [intensity_double.^0.25; intensity_double.^0.25]; %Here the intensities are scaled by 0.25 in order for them to be more visually prominent on the plot.
%pcolor(x2, y2, z3)
%shadingMap = gray(64);
%colormap(shadingMap(:,1).*[0.8,0,0]);
%shading interp

Analysing the relationship between slit width and distance of diffraction maxima
Based on the recorded markings in the single slit scenario record your trials in the code block below. Generate a linear plot comparing the slit width versus the distance from the central maxima to the first and second order minima. Remember that your plot must represent the equation for the single slit scenario be sure to plot your axes with the correct variable.
Once you generate your plots and linear fit. Extract the wavelength of the light based on the slope. Is there a difference between the first order slope and second order slope? Remember to include any error or uncertainty when reporting your final values.
% a_data = [] %slit widths
% y1_single = [] % distances from first order minima to central maxima
% y2_single = [] % distances from second order minima to central maxima

%single_slit_model1 = fitlm() %Insert variables needed to generate a linear plot with the slope.
%single_slit_model2 = fitlm() %Insert variables needed to generate a linear plot with the slope.
%plot(single_slit_model1) % Generate plot needed to extract the slope.
%hold on
%plot(single_slit_model2)
%hold off


Analysing the relationship between slit separation and distance of interference maxima
Based on the recorded markings in the double slit scenario record your trials in the code block below. Generate a linear plot comparing the slit separation for a constant width versus the distance from the central maxima to the first and second order maximas. Using your recorded value for the variable double slit and your model, determine the unknown slit separation.
% d_data = [] %slit separations
% y1_double = [] % distances from first order maxima to central maxima
% y2_double = [] % distances from second order maxima to central maxima
%double_slit_model1 = fitlm() %Insert variables needed to generate a linear plot with the slope.
%double_slit_model2 = fitlm() %Insert variables needed to generate a linear plot with the slope.
%plot(double_slit_model1) % Generate plot needed to extract the slope.
%hold on
%plot(double_slit_model2)
%hold off
