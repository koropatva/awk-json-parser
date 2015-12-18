BEGIN{ 
	print "Start";
	i = 0;
}

{
	iss =  oParam($0, "\"issues\"", 1, 1)
	output[i,0] = substr($0, 0, 10);
	output[i,1] = substr($0, 37, 17);
	output[i,2] = sParam(iss, "\"issueCmtId\"", 1, 1);
	output[i,3] = sParam(iss, "\"status\"", 1, 1);
	payments =  aaParam($0, "\"successfulOrderPayments\"");
	output[i,4] = saParam(payments, "\"cmtId\"");
	i++;
	j = 5;
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
