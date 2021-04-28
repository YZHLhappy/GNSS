function [UTC] = JD_to_UTC_function(JD_s)
%from JD TO UTC
%if the input is MJD, we should first get: JD=MJD+2400000.5 
 JD_s = JD_s; 
 a=fix(JD_s+0.5);
 b=a+1537;
 c=fix((b-122.1)/365.25);
 d=fix(365.25*c);
 e=fix((b-d)/30.6001);
 D = b-d-floor(30.6001*e)+(JD_s+0.5-fix(JD_s+0.5));
 D_output = fix(D);
 M = e-1-12*fix(e/14);
 Y = c-4715-fix((7+M)/10);
 h_t = (D-fix(D))*24;
 h_JD_to_UTC = fix(h_t);
 m_t = (h_t-fix(h_t))*60;
 m_JD_to_UTC = fix(m_t);
 s_t = (m_t-fix(m_t))*60;
 s_JD_to_UTC = fix(s_t);
 UTC = [Y;M;D_output;h_JD_to_UTC;m_JD_to_UTC;s_JD_to_UTC];
end

