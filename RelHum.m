function RH = RelHum(Tdb,Twb)
%Relative humidity calculation
% calculated from measured values of the dry-bulb temperature Tdb, 
% and the wet-bulb temperature
c2f = @(c) (c * 9/5) + 32;
Tdbf = c2f(Tdb);
Twbf = c2f(Twb);
VP = exp((16.78*Twbf-116.9)/(Twbf+273.3))-0.066858*(1+0.00115*Twbf)*(Tdbf-Twbf);
SVP = exp((16.78*Tdbf-116.9)/(Tdbf+273.3));
RH = VP/SVP*100;
end