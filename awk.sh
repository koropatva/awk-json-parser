BEGIN{ 
	print "Start";
	i = 0;
}

{
	iss =  oParam($0, "\"issues\"", 1, 1) ""
	output[i,0] = sParam(iss, "created", 1, 1);
	i++;
	j = 2;
}

END{ 
	for(i1 = 0; i1 < i; i1++){
		outputData = "";
		for(j1 = 0; j1 <= j; j1++){
			outputData = outputData " " output[i1,j1];
		}
		print outputData;
	}
	print $0
}
