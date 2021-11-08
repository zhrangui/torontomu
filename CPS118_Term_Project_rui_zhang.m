%% 1: Calculate the yearly average temperature
datatable = getdata('glsea-temps2020_1024.dat.txt');
eachaverage = mean(datatable{:, 3:end});
totalaverage = mean(datatable{:, 3:end}, 'all');

%% 2: Indicate which lake is the coldest and which one is the warmest
lakes = ["Sup","Mich","Huron","Erie","Ont","St.Clr"];
minaverage = min(eachaverage);
maxaverage = max(eachaverage);
minlake = lakes(eachaverage==minaverage);
maxlake = lakes(eachaverage==maxaverage);
abovelakes = lakes(eachaverage > totalaverage);
belowlakes = lakes(eachaverage < totalaverage);

%% 3: Indicate the day and the temperature for the warmest water temperatures 
warmests = max(datatable{:, 3:end});
coldests = min(datatable{:, 3:end});
% Find warmest date
Suparwmest = datatable{datatable{:,3}==warmests(1),[1 2 3]};
Michwarmest = datatable{datatable{:,4}==warmests(2),[1 2 4]};
HuronWarmest = datatable{datatable{:,5}==warmests(3),[1 2 5]};
Eriewarmest = datatable{datatable{:,6}==warmests(4),[1 2 6]};
Ontwarmest = datatable{datatable{:,7}==warmests(5),[1 2 7]};
StClrwarmest = datatable{datatable{:,8}==warmests(6),[1 2 8]};
% Find coolest date
Supcoolest = datatable{datatable{:,3}==coldests(1),[1 2 3]};
Michcoolest = datatable{datatable{:,4}==coldests(2),[1 2 4]};
Huroncoolest = datatable{datatable{:,5}==coldests(3),[1 2 5]};
Eriecoolest = datatable{datatable{:,6}==coldests(4),[1 2 6]};
Ontcoolest = datatable{datatable{:,7}==coldests(5),[1 2 7]};
StClrcoolest = datatable{datatable{:,8}==coldests(6),[1 2 8]};

%% 4: Indicate the day, lake and temperature of the warmest water temperature 
maxall = max(datatable{:,3:end}, [], 'all');
[maxrow maxcolumn] = find(datatable{:,3:end}==maxall);
minall = min(datatable{:,3:end}, [], 'all');
[minrow mincolumn] = find(datatable{:,3:end}==minall);


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