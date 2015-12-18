function arrayAllValue(query, search,  result){
        return arrayValue(query, search, 0, 0);
}

function arrayValue(query, search, number, size,  result){
	return criteriaValue(query, search, "[", "]", number, size);
}

function objectAllValue(query, search,  result){
        return objectValue(query, search, 0, 0);
}

function objectValue(query, search, number, size,  result){
	return criteriaValue(query, search, "{", "}", number, size);
}

function criteriaValue(query, search, begin, end, number, size,  result){
        n = split(query "",a,",");
        result = "";
        tmp = "";
        fl = 0;
        count = 0;

        for(j = 0; j < n; j++){

                if(index(a[j], search) > 0){
                        tmp = a[j];
                        if(index(a[j], begin) > 0){ fl++; }
                        if(index(a[j], end) > 0){ fl--; }
                } else if(tmp != ""){
                        tmp = tmp ", " a[j];
                        if(index(a[j], begin) > 0){ fl++;}
                        if(index(a[j], end) > 0){ fl--;}
                }

               if(tmp != "" &&  fl == 0){
                          count++;
                          if( ( count >= number && count < number + size ) || number == 0){ result = result ", " tmp;}
		          tmp = "";
                }
        }
        return result;
}

function simpleAllValue(query, search,  result){
        return simpleValue(query, search, 0, 0);
}

function simpleValue(query, search, number, size,  result){
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
