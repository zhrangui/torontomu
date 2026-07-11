PCS 130 Lab 1 Magnetic Fields
In this lab we will be looking at magnetic fields. You will be tasked with analyzing the magnetic field produced by coils.
Using graphical analysis you will record and import data into matlab to be analysed.
For this experiment you will get examples on how to do various tasks in matlab such as:
Creating variables
Importing and indexing data
Using data to perform calculations
Visualize data.
Fitting a non-linear equation.
Creating plots of multiple data.

Creating a data structure of your experimental data in matlab
Before any calculations are performed, we want to make sure we have all the data necessary. We will need to create a variable and a data structure to hold the experimental results. There are many different data structures/types we can use in matlab to organize our data. For the purpose of this lab, we will show you two ways to organize your data. Method 1 as an array or matrix and method 2 as a table.
To create a variable, enter the name you would like to give it followed by the equal sign and its value. For example to create a variable for the number 'ten' see the code below. 
ten = 10

In the code blocks below are skeletons of the values you will need for this lab. Notice that some text appears in green. There are code comments. Comments are notes you can leave in the code and often explain what the code does. Code comments do not actually execute any code. Once you have put in all the values of your variables, run the section of code either by pressing 'run section' on the top toolbar under the live editor tab or by pressing cmd+enter.
Once you have declared your starting variables, you should see them appear in the workspace to the right. The workspace gives you an idea of your active variables and their various attributes such as its name, values/dimensions and its class. The next sections will go over actually declaring your variables.

Method 1: Recording experimental values manually
The simplest way to create a data structure in matlab is through an array or matrix. A matrix holds a number of values in a row and column type fashion. This allows you to declare a variable with multiple values that you can then use operators on (such as multiplication and addition) or functions, greatly speeding up tasks like calculations. 
The most basic way to create an array is to use square brackets and commas to seperate each value as shown below:
data = [1,2,3,4]
The result of the above code would create a row vector with the elements 1,2,3,4.
See the matlab documentation here for a more in-depth way of creating matrices/arrays.
In the code block below, enter the experimental data you recorded for the magnetic fields from graphical analysis in a similar fashion as shown above. Also fill in your 'z' data into the next array. These two variables will serve as the backbone for your calculations and plotting in the later sections.
Once the data is recorded, run the section.
If you recorded your values in a spreadsheet software such as microsoft excel or google sheets skip to the next section.
%Insert your average magnetic field values calculated from graphical
%analysis into the square brackets below.

measured_magnetic_field = [];

z = [];


Method 2: Importing your experimental values from a .csv
Another way to import data into matlab is through a .csv (comma seperated value) file. If you kept track of your data using a spreadsheet such as microsoft excel or google shhets, export it as a .csv file and use the import readtable() function below. In order to read in the table, you will need to get the 'path' of the file. The path identifies where in the computer your file is stored. 
To get the path on the lab Mac follow the steps below.
On the Mac, click the finder icon in the dock to open a Finder window.
Navigate to where you downloaded the file. It is likely in the downloads folder.
Choose View > Show Path Bar, or press the Option key to show the path bar momentarily. The location and nested folders that contain your file or folder are displayed near the bottom of the Finder window.
Right click the bar on the bottom of the finder window and copy.
Once you have copied the path, paste the string into the brackets of the readtable function below. Since it is a string, make sure that it is in quotations.
 Note that depending on how you organized it on the spread sheet may affect how your table is imported!
% Import the data. Uncomment the line below and insert the path into the
% readtable function.
% data_table = readtable('Paste the path to the file here'); 
Once you have imported the data as a table, inspect it by double clicking the variable in the workspace. Take note of the column names of your table. To actually use the data you will need to index it to access it.
Note that this will depend on how you imported your data as it will correspond to the column names of your table. 
In general the syntax for calling the data in a column of a table can be done using .(dot notation) as shown below:
table_name.column_name
Therefore, if you wanted to access the 'z' data in your table it might look something like this.
data_table.z_data


Plotting the data as a scatter plot
Once you have entered your experimental data for the magnetic field, plot it as a scatter plot to see the general trend of how the magnetic field varies as a function of the distance, 'z'. In the code block below you are given the function to create a scatter plot as well as change the axes titles. Make sure to replace the corresponding x and y variables with the actual variables you are interested in from the previous section.
%plot the magnetic field and the distance away. The
%function in matlab to plot two variables as a scatter plot is
%scatter(x,y). Replace x and y with your relevant variables.

scatter(x,y)
title('Insert your Title Here')
ylabel('Insert your y-axis title here')
xlabel('Insert your x-axis title here')

Estimating a fit for the Magnetic Field
In the lab manual, you are given the general form of the equation for the magnetic field. The overall goal of this section is to test different values for the fitting parameters (A, B and C values) in order to estimate a fit for it. When testing out different values, you want to try and generate a line that will match the points in your scatter plot.
As a starting point, try the theoretical values of what the variables A, B and C should represent then adjust the values by a small amount until the line fits your scatter plot well. Rerun the code block (cmd+c on the mac, ctrl+c on windows) after changing your values each time.
%Create the equation for the magnetic field for your given distance along
%the z-direction. Test different values for A, B and C. Note that you may need
%to declare additional constants.

N = 0 %Number of coil loops
I =  0%Current
mu =  0%permeability constant
A =  0% Fitting parameter, change this value and replot to see the effect
B =  0%Fitting parameter, change this value and replot to see the effect
C = 0%Fitting parameter. Hint: Depending on how you got your z-values you may not need this for the single coil set-up!


%General Fitting equation for one magnetic field
fitted_magnetic_field = A*(B^2)./((z+C).^2+B^2).^(3/2); 


% Plotting estimated equation for the magnetic field with the scatter plot
% of measured magnetic field values.
plot(z,fitted_magnetic_field)
hold on
scatter(z,measured_magnetic_field)
title('Insert your Title Here')
ylabel('Insert your y-axis title here')
xlabel('Insert your x-axis title here')
hold off

Introducing a second magnetic field
Repeat your methodology fill in the data after introducing a second magnetic field. Recall the steps to export data from graphical analysis and import another set of data into matlab. Note that for your Helmholtz (two coil) set-up you may need to add in another parameter. In the code block below you will need to enter in the formula for the helholtz magnetic field under the 'helmholtz_fit_magnetic_field' variable.
% Fill in the below array with your distances and magnetic field from the
% two coil (Helmholtz) set-up. Replace the 0s to the values or equations
% they should be.

z_two = [];%m
measured_field_two = [];%mT

I_two = 0%Recall that the two coils are set up in parallel
B = 0
A = 0
C = 0
field_one = 0
field_two = 0

helmholtz_fit_magnetic_field = 0

scatter(z_two,measured_field_two)
hold on
plot(z_two,helmholtz_fit_magnetic_field)
title('Insert your Title Here')
ylabel('Insert your y-axis title here')
xlabel('Insert your x-axis title here')
legend('Helmholtz Magnetic Field Data','Fitted Helmholtz Magnetic Field Data')
hold off


Varying the distance between the coils
Using your equation above, you should be able to pinpoint a parameter related to the distance between the two coils and the resultant magnetic fields. Copy the equation from the previous section into the varying_sepearation_field variable and change the parameter to C_v. This will allow you to use the controller to change the value and update the plot incrementally.
Try plotting at different values to see what happens to the resultant field as you change the distance between the coils. What do you think is happening as the magnetic fields move closer and farther apart?
C_v = 0 %Use the controller here to try different values for C_v

varying_separation_field = 0
plot(z_two,varying_separation_field)
title('Varying the distance between the coils')
ylabel('Insert your y-axis title here')
xlabel('Insert your x-axis title here')

Comparison of the Estimated Magnetic Field and Theoretical
Compare the estimated magnetic field with the expected (theoretical) parameters from the Biot-Savart equation. 
In the code block below you will need to create the equations computing the percent error for your estimated parameters in the single coil set-up.
%Calculate the % error between your fit parameters for the single coil set-up.
%The formula for percent error is written out for you below.
%Remember the variables in your fitting equation
%are meant to represent variables from the theoretical Biot-Savart
%equation. 

%Change the measured and expected value variables to the appropriate
%variables you used. Remember that you have 3 fitting parameters to compare
%against (A, B and C) so you will need a percent error for each!
percent_error = abs((measured_value-expected_value)/expected_value)*100



Plot both your estimated fit (with the scatter plot) and the theoretical magnetic field on the same graph using the code block below. Note that you will need to input the code yourself.
%In the code below compile your plots from before, but this time include
%what the theoretical plot should be. As a hint take a look at how the
%code is written in the previous sections. Note that the hold on/off is
%used to retain the axes so that you can plot multiple elements onto the
%same graph.

helmholtz_fit_magnetic_field = 0 % You should get these values from the fit you produce in the previous section
%theoretical_magnetic_field_two = 0 %In This line calculate the
%theoretical magnetic fields for your given z value.
scatter(z_two,measured_field_two)
hold on
plot(z_two,helmholtz_fit_magnetic_field)
%plot(x,y) Add in another plot here for the theoretical or expected line.
title('Insert your Title Here')
ylabel('Insert your y-axis title here')
xlabel('Insert your x-axis title here')
legend('Helmholtz Magnetic Field Data','Fitted Helmholtz Magnetic Field Data')
hold off



