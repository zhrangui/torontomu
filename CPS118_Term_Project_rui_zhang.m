%% 1: Calculate the yearly average temperature
datatable = getdata('glsea-temps2020_1024.dat.txt');
eachaverage = mean(datatable{:, 3:end});
totalaverage = mean(datatable{:, 3:end}, 'all');

%% 2:
lakes = ["Sup","Mich","Huron","Erie","Ont","St.Clr"];
minimum = min(eachaverage);
maximum = max(eachaverage);
minlake = lakes(eachaverage==minimun);
maxlake = lakes(eachaverage==maximum);
abovelakes = lakes(eachaverage > totalaverage);
belowlakes = lakes(eachaverage < totalaverage);

%% 3:

%% 4:
%% 5:
%% 6:
%% 7:
%% 8:
%% 9:
%% 10:
%% 11:
%% 12:
%% 13:
%% 14:

% funtion to read file data
function data = getdata(filename) 
    fid = fopen(filename) ;
    % skip 10 lines head lines
    data = textscan(fid,'%d %d %f %f %f %f %f %f','HeaderLines',10) ;
    fclose(fid);
    % Extract data into table, each culumn responds to data of each lake
    data = table(data{:}, 'VariableNames', {'year','day','Sup','Mich','Huron','Erie','Ont','St.Clr'});
end