#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char *sec_to_s(long int s){
	long int min, h, day, week;
	char *s_s, *s_min, *s_h, *s_day, *s_week;
	s -= (min = s/60)*60;
	min -= (h = min/60)*60;
	h -= (day = h/24)*24;
	day -= (week = day/7)*7;
	sprintf(s_s, "%s", s);
	sprintf(s_min, "%s", min);
	sprintf(s_h, "%s", h);
	sprintf(s_day, "%s", day);
	sprintf(s_week, "%s", week);
	return strcat(week?strcat(s_week, "sem"):"",
		strcat(day?strcat(week?" ":"", strcat(s_day, "day")):"",
			strcat(h?strcat(day?" ":"", strcat(s_h, "h")):"",
				strcat(min?strcat(h?" ":"", strcat(s_min, "min")):"", s?strcat(min?" ":"", strcat(s_s, "s")):""))));
}

int main(){
	printf("%s", sec_to_s(900121));
	return 0;
}
