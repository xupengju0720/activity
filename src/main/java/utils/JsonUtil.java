package utils;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {
public static String toString(Object o) {
	ObjectMapper mapper=new ObjectMapper();
try {
	return mapper.writeValueAsString(o);
} catch (Exception e) {
return "";
	
}

}
public static <T> T toObjct(String str,Class<T> cla) {
	ObjectMapper mapper=new ObjectMapper();
	try {
		return mapper.readValue(str, cla);
	} catch (Exception e) {
		return null;
	}
}

public static String returnvalue(int stutas,String txt) {
	return toString(new Json(stutas, txt));
}

public static class Json{
	
	int stutas;
	String txt;
	
	public Json(int stutas, String txt) {
		super();
		this.stutas = stutas;
		this.txt = txt;
	}
	public int getStutas() {
		return stutas;
	}
	public void setStutas(int stutas) {
		this.stutas = stutas;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	
}
}
