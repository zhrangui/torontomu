% Mina Alam - 500900005
% Rui Zhang - 500736315

%% Problem 1:
% input integers
vect = input('input a vector of integers: ');
for v = vect
    fprintf('%d ', v);
end
fprintf('\n');
% Check if each value is positive
for v = vect
    if v > 0
        % Value is positive
        out = v * 2;
    else
        % Value is negative
        out = v *3;
    end
    fprintf('%d ', out);
end


%% Problem 2:
for n = [3 7]
    % Initialize pascal matrix
    pas = zeros(n);
    % Calculate each pascal value in different row and column
    for k = (1:n)
        for l = (1:k)
            pas(k,l) = factorial(k-1)/(factorial(l-1)*factorial(k-l));
        end
    end
    disp(pas);
end


%% Problem 3:
% User input
gender = input('Enter your gender (male or female): ', 's');
age = input('Enter age (number): ');
RHR = input('Enter resting heart rate (number): ');
fitnesslevel = input('Enter fitness level (low, medium, or high): ', 's');
% Calculate maximum heart rate according male or female
if gender == "male"
    MHR = 203.7/(1+exp(0.033*(age-104.3)));
else
    MHR = 190.2/(1+exp(0.0453*(age-107.5)));
end
% Set fitness value by its level
switch fitnesslevel
    case 'low'
        INTEN = 0.55;
    case 'medium'
        INTEN = 0.65;
    otherwise
        INTEN = 0.8;
end
%  Calculating the training heart rate
THR = (MHR - RHR) * INTEN + RHR;
fprintf('Training heart rate: %d\n', round(THR));

%% Problem 4:
W = input('Enter weight (lb): ');
H = input('Enter height (in.): ');
% Calculate BMI by weight and height
BMI = 703*W/power(H,2);
% Classify obseity by BMI value
if BMI < 18.5
    fprintf('Your BMI value is %d, which classifies you as Underweight\n', round(BMI));
elseif BMI < 24.9
    fprintf('Your BMI value is %d, which classifies you as Normal\n', round(BMI));
elseif BMI < 29.9
    fprintf('Your BMI value is %d, which classifies you as Overweight\n', round(BMI));
else
    fprintf('Your BMI value is %d, which classifies you as Obese\n', round(BMI));
end

%% Problem 5:
% User input
quizzes = input('Quiz grades: ');
midterm = input('Miderm grade: ');
finalterm = input('Final exam: ');
n = length(quizzes);
quizzes = sort(quizzes);
% Remove lowest two quizzes and average rest 
averagequizzes = mean(quizzes(3:end));
% Calcalete final grade by midterm and finalterm grades condition 
if midterm >= finalterm
    grade = 0.25*averagequizzes + 0.35*midterm + 0.4*finalterm;
    fprintf('Overall grade: %d\n', round(grade));
else
    grade = 0.25*averagequizzes + 0.25*midterm + 0.5*finalterm;
    fprintf('Overall grade: %d\n', round(grade));
end



