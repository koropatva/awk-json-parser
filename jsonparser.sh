function oaParam(query, search,  result){
        return oParam(query, search, 0, 0,  result);
}

function oParam(query, search, number, size,  result){
        n = split(query "",a,",");
        result = "";
        tmp = "";
        fl = 0;
        count = 0;

        for(j = 0; j < n; j++){

                if(index(a[j], search) > 0){
                        tmp = a[j];
                        if(index(a[j], "{") > 0){ fl++; }
                        if(index(a[j], "}") > 0){ fl--; }
                } else if(tmp != ""){
                        tmp = tmp ", " a[j];
                        if(index(a[j], "{") > 0){ fl++;}
                        if(index(a[j], "}") > 0){ fl--;}
                }

               if(tmp != "" &&  fl == 0){
                          count++;
                          if( ( count >= number && count < number + size ) || number == 0){ result = result ", " tmp;}
		          tmp = "";
                }
        }
        return result;
}

function saParam(query, search,  result){
        return sParam(query, search, 0, 0,  result);
}

function sParam(query, search, number, size,  result){
        n = split(query "", a, ",");
        result = "";
        tnp = "";
        count = 0;

        for(j = 0; j < n; j++){

                if(index(a[j], ":") > 0 && index(a[j], search) > 0){ tmp = a[j]; }
                if(tmp != ""){
                        count++;
                        if(count >= number && count < number + size || number == 0){ 
				k = split(tmp, kk, ":");
				key = kk[k - 1];
				tmp = substr(key, index(key, "\""), length(key)) ":" kk[k];
				result = result " " tmp;
			}
                        tmp = "";
                }
        }
        return result;
}
